#include <fstream>

#include <opencv2/opencv.hpp>
#include <nadjieb/mjpeg_streamer.hpp>
#include "detect.hpp"
#include "loader.hpp"

const std::vector<cv::Scalar> colors = {cv::Scalar(255, 255, 0), cv::Scalar(0, 255, 0), cv::Scalar(0, 255, 255), cv::Scalar(255, 0, 0)};

using MJPEGStreamer = nadjieb::MJPEGStreamer;

int main(int argc, char **argv) {
  bool is_cuda = argc > 1 && strcmp(argv[1], "cuda") == 0;

  cv::dnn::Net net;
  load_net(net, is_cuda);

  std::vector<std::string> class_list = load_class_list();
  cv::Mat frame;
  cv::VideoCapture cap(0);
  if (!cap.isOpened()) {
    std::cerr << "ERROR: Could not open camera" << std::endl;
    exit(EXIT_FAILURE);
  }

  auto start = std::chrono::high_resolution_clock::now();
  int frame_count = 0;
  float fps = -1;

  std::vector<int> params = {cv::IMWRITE_JPEG_QUALITY, 90};

  MJPEGStreamer streamer;

  // By default "/shutdown" is the target to graceful shutdown the streamer
  // if you want to change the target to graceful shutdown:
  //      streamer.setShutdownTarget("/stop");

  // By default 1 worker is used for streaming
  // if you want to use 4 workers:
  //      streamer.start(8080, 4);
  streamer.start(8080);

  // Visit /shutdown or another defined target to stop the loop and graceful shutdown
  while (streamer.isRunning()) {
    cap >> frame;
    frame_count++;

    std::vector<Detection> output;
    detect(frame, net, output, class_list);
    int detections = output.size();

    for (int i = 0; i < detections; ++i) {
        auto detection = output[i];
        auto box = detection.box;
        auto classId = detection.class_id;
        const auto color = colors[classId % colors.size()];
        cv::rectangle(frame, box, color, 3);

        cv::rectangle(frame, cv::Point(box.x, box.y - 20), cv::Point(box.x + box.width, box.y), color, cv::FILLED);
        cv::putText(frame, class_list[classId].c_str(), cv::Point(box.x, box.y - 5), cv::FONT_HERSHEY_SIMPLEX, 0.5, cv::Scalar(0, 0, 0));
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
        cv::putText(frame, fps_label_str.c_str(), cv::Point(10, 25), cv::FONT_HERSHEY_SIMPLEX, 1, cv::Scalar(0, 0, 255), 2);
    }

    std::vector<uchar> buff_bgr;
    cv::imencode(".jpg", frame, buff_bgr, params);
    streamer.publish("/stream.mjpg", std::string(buff_bgr.begin(), buff_bgr.end()));
    std::this_thread::sleep_for(std::chrono::milliseconds(10));
  }

  streamer.stop();
  cap.release();

  return 0;
}
