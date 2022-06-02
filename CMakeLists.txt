cmake_minimum_required(VERSION 3.6 FATAL_ERROR)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT "detect")

# Create Project
project(real_time_object_detection)
add_executable(detect main.cpp)

find_package(OpenCV REQUIRED)
find_package(nadjieb_mjpeg_streamer REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})
target_link_libraries(detect PRIVATE nadjieb_mjpeg_streamer::nadjieb_mjpeg_streamer ${OpenCV_LIBS})
