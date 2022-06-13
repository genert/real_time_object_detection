#include "src/Loader.hpp"
#include "src/Detect.hpp"
#include "src/Receiver.hpp"

#include <opencv2/opencv.hpp>
#include <nadjieb/mjpeg_streamer.hpp>
#include <chrono>
#include <args.hxx>
#include <thread>
#include <iostream>


#define DEFAULT_SERVER_PORT 8080
#define DEFAULT_SERVER_WORKERS 1

using MJPEGStreamer = nadjieb::MJPEGStreamer;
using time_point = std::chrono::high_resolution_clock::time_point;
using high_resolution_clock = std::chrono::high_resolution_clock;

const std::vector<cv::Scalar> colors = {
        cv::Scalar(255, 255, 0),
        cv::Scalar(0, 255, 0),
        cv::Scalar(0, 255, 255),
        cv::Scalar(255, 0, 0),
};

int
protected_main(int argc, char **argv) {
    args::ArgumentParser parser("Real time object detection");
    args::HelpFlag help(parser, "help", "Display this help menu", {'h', "help"});
    args::ValueFlag<int> port(parser, "port", "The port of the server", {'p', "port"});
    args::Flag enableDetection(parser, "Enable detection", "Enable Yolo v5 model object detection",
                               {"d", "enable_detection"});
    args::Flag cuda(parser, "cuda", "Enable cuda", {'c', "cuda"});
    args::ValueFlag<std::string> deviceAddress(parser, "Device address", "The address of the camera device", {'a', "device_address"});
    args::ValueFlag<int> device_id(parser, "Device ID", "Use device ID for video stream", {"d", "device_id"});

    try {
        parser.ParseCLI(argc, argv);
    } catch (args::Help) {
        std::cout << parser;
        return 0;
    } catch (args::ParseError e) {
        std::cerr << e.what() << std::endl;
        std::cerr << parser;
        return 1;
    } catch (args::ValidationError e) {
        std::cerr << e.what() << std::endl;
        std::cerr << parser;
        return 1;
    }

    std::cout << "Starting to listen for video capture" << std::endl;

    cv::VideoCapture video_capture;
    if (deviceAddress) {
        video_capture = cv::VideoCapture(args::get(deviceAddress), cv::CAP_FFMPEG);
    } else {
        video_capture = cv::VideoCapture(device_id ? args::get(device_id) : 0);
    }

    if (!video_capture.isOpened()) {
        fprintf(stderr, "could not open video\n");
        video_capture.release();
        return 1;
    }

    // Load Darknet model
    cv::dnn::Net net;
    std::vector<std::string> class_list = load_class_list();
    cv::Mat frame;
    int frame_count = 0;
    float fps = -1;
    auto start = std::chrono::high_resolution_clock::now();
    load_net(net, cuda);
    std::cout << "Darknet model loaded" << std::endl;

    // Start MJPEG Streamer
    MJPEGStreamer streamer;
    std::vector<int> params = {cv::IMWRITE_JPEG_QUALITY, 90};
    std::cout << "Starting MJPEG streamer" << std::endl;
    streamer.start(port ? args::get(port) : DEFAULT_SERVER_PORT, DEFAULT_SERVER_WORKERS);
    std::cout << "http://localhost:" << (port ? args::get(port) : DEFAULT_SERVER_PORT) << std::endl;

    std::cout << "Read to accept frames from video capture" << std::endl;

    // Visit /shutdown or another defined target to stop the loop and graceful shutdown
    while (streamer.isRunning()) {
        video_capture >> frame;
        frame_count++;

        if (enableDetection) {
            std::vector<Detection> output;
            detect(frame, net, output, class_list);
            int detections = output.size();

            for (int i = 0; i < detections; ++i) {
                auto detection = output[i];
                auto box = detection.box;
                auto classId = detection.class_id;
                const auto color = colors[classId % colors.size()];

                // Object label
                std::stringstream label;
                label << class_list[classId] << " " << std::fixed << std::setprecision(2) << detection.confidence * 100
                      << "%";

                cv::rectangle(frame, box, color, 3);
                cv::rectangle(frame, cv::Point(box.x, box.y - 20), cv::Point(box.x + box.width, box.y), color,
                              cv::FILLED);
                cv::putText(frame, label.str(), cv::Point(box.x, box.y - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5,
                            cv::Scalar(0, 0, 0));
            }
        }

        if (frame_count >= 30) {
            auto end = std::chrono::high_resolution_clock::now();
            fps = frame_count * 1000.0 / std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
            frame_count = 0;
            start = std::chrono::high_resolution_clock::now();
        }

        if (fps > 0) {
            std::ostringstream fps_label;
            fps_label << std::fixed << std::setprecision(2);
            fps_label << "FPS: " << fps;
            std::string fps_label_str = fps_label.str();
            cv::putText(frame, fps_label_str.c_str(), cv::Point(10, 25), cv::FONT_HERSHEY_SIMPLEX, 1,
                        cv::Scalar(0, 0, 255), 2);
        }

        std::vector<uchar> buff_bgr;
        cv::imencode(".jpg", frame, buff_bgr, params);
        streamer.publish("/", std::string(buff_bgr.begin(), buff_bgr.end()));
        std::this_thread::sleep_for(std::chrono::milliseconds(5));
    }

    std::cout << "Exiting..." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(3000));
    streamer.stop();
    video_capture.release();

    //Receiver receiver;
    //std::thread r([&] { receiver.listen(boost::asio::ip::make_address("0.0.0.0"), 35001); });

    //r.join();

    return 0;
}

int
main(int argc, char **argv) {
    try {
        return protected_main(argc, argv);
    }
    catch (const std::exception &e) {
        std::cerr << "Caught unhandled exception:\n";
        std::cerr << " - what(): " << e.what() << '\n';
    }
    catch (...) {
        std::cerr << "Caught unknown exception\n";
    }

    return EXIT_FAILURE;
}