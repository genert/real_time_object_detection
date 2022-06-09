cmake_minimum_required(VERSION 3.6 FATAL_ERROR)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(${OpenCV_INCLUDE_DIRS})
include_directories("src/"
        "src/inc/")

# Create Project
project(real_time_object_detection)
file(GLOB real_time_object_detection_src
    "src/loader.hpp"
    "src/detect.hpp"
    "src/h264bsd_transform.c"
    "src/h264bsd_util.c"
    "src/h264bsd_byte_stream.c"
    "src/h264bsd_seq_param_set.c"
    "src/h264bsd_pic_param_set.c"
    "src/h264bsd_slice_header.c"
    "src/h264bsd_slice_data.c"
    "src/h264bsd_macroblock_layer.c"
    "src/h264bsd_stream.c"
    "src/h264bsd_vlc.c"
    "src/h264bsd_cavlc.c"
    "src/h264bsd_nal_unit.c"
    "src/h264bsd_neighbour.c"
    "src/h264bsd_storage.c"
    "src/h264bsd_slice_group_map.c"
    "src/h264bsd_intra_prediction.c"
    "src/h264bsd_inter_prediction.c"
    "src/h264bsd_reconstruct.c"
    "src/h264bsd_dpb.c"
    "src/h264bsd_image.c"
    "src/h264bsd_deblocking.c"
    "src/h264bsd_conceal.c"
    "src/h264bsd_vui.c"
    "src/h264bsd_pic_order_cnt.c"
    "src/h264bsd_decoder.c"
    "src/H264SwDecApi.c"
    "src/extraFlags.c"
    "src/Decoder.cpp"
    "receiver.cpp"
)
add_executable(receiver ${real_time_object_detection_src})

find_path(AVCODEC_INCLUDE_DIR libavcodec/avcodec.h)
find_library(AVCODEC_LIBRARY avcodec)
find_path(AVFORMAT_INCLUDE_DIR libavformat/avformat.h)
find_library(AVFORMAT_LIBRARY avformat)
find_path(AVUTIL_INCLUDE_DIR libavutil/avutil.h)
find_library(AVUTIL_LIBRARY avutil)
find_path(AVDEVICE_INCLUDE_DIR libavdevice/avdevice.h)
find_library(AVDEVICE_LIBRARY avdevice)
find_package(OpenCV REQUIRED)
find_package(nadjieb_mjpeg_streamer REQUIRED)


target_include_directories(receiver PRIVATE ${AVCODEC_INCLUDE_DIR} ${AVFORMAT_INCLUDE_DIR} ${AVUTIL_INCLUDE_DIR} ${AVDEVICE_INCLUDE_DIR})
target_link_libraries(receiver PRIVATE nadjieb_mjpeg_streamer::nadjieb_mjpeg_streamer ${OpenCV_LIBS} ${AVCODEC_LIBRARY} ${AVFORMAT_LIBRARY} ${AVUTIL_LIBRARY} ${AVDEVICE_LIBRARY})
