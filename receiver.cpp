#include <fstream>
#include <valarray>
#include <iostream>
#include <algorithm>

#include <opencv2/opencv.hpp>
#include <nadjieb/mjpeg_streamer.hpp>
#include <args.hxx>
#include "src/detect.hpp"
#include "src/loader.hpp"
#include "src/h264decoder.hpp"
#include "src/Decoder.h"

#define DEFAULT_SERVER_PORT 8080
#define DEFAULT_SERVER_WORKERS 1
#define MAX_SIZE 1514

const std::vector<cv::Scalar> colors = {
        cv::Scalar(255, 255, 0),
        cv::Scalar(0, 255, 0),
        cv::Scalar(0, 255, 255),
        cv::Scalar(255, 0, 0),
};

using MJPEGStreamer = nadjieb::MJPEGStreamer;

int
protected_main(int argc, char **argv) {
    args::ArgumentParser parser("Real time object detection");
    args::HelpFlag help(parser, "help", "Display this help menu", {'h', "help"});
    args::ValueFlag<int> port(parser, "port", "The port of the server", {'p', "port"});
    args::ValueFlag<int> workers(parser, "workers", "The workers count for streaming server", {"w", "workers"});
    args::Flag enableDetection(parser, "Enable detection", "Enable Yolo v5 model object detection",
                               {"d", "enable_detection"});
    args::Flag cuda(parser, "cuda", "Enable cuda", {'c', "cuda"});
    args::ValueFlag<int> device_id(parser, "device ID", "Use device ID for video stream", {"d", "device_id"});
    args::ValueFlag<int> udpPort(parser, "port", "The port of UDP streaming server", {"up", "udp_port"});

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

    // Create UDP listener
    struct sockaddr_in our_address;
    struct sockaddr_in remote_address;
    socklen_t remote_address_len = sizeof(remote_address);
    int fd;

    if ((fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
        throw std::runtime_error("socket creation failed");
    }

    int reuse = 1;
    if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (const char *) &reuse, sizeof(reuse)) < 0)
        perror("setsockopt(SO_REUSEADDR) failed");

#ifdef SO_REUSEPORT
    if (setsockopt(fd, SOL_SOCKET, SO_REUSEPORT, (const char *) &reuse, sizeof(reuse)) < 0)
        perror("setsockopt(SO_REUSEPORT) failed");
#endif

    memset((char *) &our_address, 0, sizeof(our_address));
    our_address.sin_family = AF_INET;
    our_address.sin_addr.s_addr = htonl(INADDR_ANY);
    our_address.sin_port = htons(udpPort ? args::get(udpPort) : 0);

    if (bind(fd, (struct sockaddr *) &our_address, sizeof(our_address)) < 0) {
        throw std::runtime_error("bind failed");
    }

    // Load model
    cv::dnn::Net net;
    load_net(net, cuda);
    std::vector<std::string> class_list = load_class_list();
    cv::Mat frame;

    // Load camera capture if specified.
    cv::VideoCapture cap;
    if (device_id) {
        cap.open(args::get(device_id));
        if (!cap.isOpened()) {
            std::cerr << "ERROR: Could not open camera" << std::endl;
            exit(EXIT_FAILURE);
        }
    }

    auto start = std::chrono::high_resolution_clock::now();
    int frame_count = 0;
    float fps = -1;

    std::vector<int> params = {cv::IMWRITE_JPEG_QUALITY, 90};

    MJPEGStreamer streamer;
    Stream s;

    std::cout << "Starting MJPEG streamer" << std::endl;
    streamer.start(port ? args::get(port) : DEFAULT_SERVER_PORT, workers ? args::get(workers) : DEFAULT_SERVER_WORKERS);
    std::cout << "MJPEG streamer is available at http://localhost:" <<  port ? args::get(port) : DEFAULT_SERVER_PORT << std::endl;

    std::array<uint8_t, MAX_SIZE> recvbuf{};

    // Visit /shutdown or another defined target to stop the loop and graceful shutdown
    while (streamer.isRunning()) {
        recvfrom(fd, recvbuf.data(), recvbuf.size() - 1, 0, (struct sockaddr *) &remote_address, &remote_address_len);
        std::rotate(recvbuf.begin(), recvbuf.begin() + 72, recvbuf.end());
        std::cout << "Received data " << recvbuf.size() << std::endl;
        cap >> frame;
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
        streamer.publish("/stream.mjpg", std::string(buff_bgr.begin(), buff_bgr.end()));
        std::this_thread::sleep_for(std::chrono::milliseconds(5));
    }

    std::cout << "Exiting..." << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(3000));
    streamer.stop();
    cap.release();
    close(fd);

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