#pragma once

#include <fstream>
#include <opencv2/opencv.hpp>

std::vector<std::string> load_class_list() {
    std::vector<std::string> class_list;
    std::ifstream ifs("../config/classes.txt");
    std::string line;

    while (getline(ifs, line)) {
        class_list.push_back(line);
    }

    return class_list;
}

void load_net(cv::dnn::Net &net, bool useGPU) {
    auto result = cv::dnn::readNet("../config/yolov5s.onnx");

    if (useGPU) {
        std::cout << "Attempty to use GPU\n";
        result.setPreferableBackend(cv::dnn::DNN_BACKEND_CUDA);
        result.setPreferableTarget(cv::dnn::DNN_TARGET_CUDA_FP16);
        net = result;
        return;
    }

    std::cout << "Running on CPU\n";
    result.setPreferableBackend(cv::dnn::DNN_BACKEND_OPENCV);
    result.setPreferableTarget(cv::dnn::DNN_TARGET_CPU);
    net = result;
}
