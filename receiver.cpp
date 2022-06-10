#include "src/Streamer.hpp"
#include "src/Decoder.hpp"

#include <string>
#include <opencv2/opencv.hpp>
#include <cstdio>
#include <chrono>
#import <sys/socket.h>
#import <netinet/in.h>

using namespace streamer;

using time_point = std::chrono::high_resolution_clock::time_point;
using high_resolution_clock = std::chrono::high_resolution_clock;

void process_frame(const cv::Mat &in, cv::Mat &out) {
    in.copyTo(out);
}


void stream_frame(Streamer &streamer, const cv::Mat &image) {
    streamer.stream_frame(image.data);
}


void stream_frame(Streamer &streamer, const cv::Mat &image, int64_t frame_duration) {
    streamer.stream_frame(image.data, frame_duration);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("must provide one command argument with the video file or stream to open\n");
        return 1;
    }

    // Create UDP listener
    struct sockaddr_in our_address;
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
    our_address.sin_port = htons(25565);

    if (bind(fd, (struct sockaddr *) &our_address, sizeof(our_address)) < 0) {
        throw std::runtime_error("bind failed");
    }

    std::string video_fname;
    video_fname = std::string(argv[1]);
    cv::VideoCapture video_capture;

    video_capture = cv::VideoCapture(0);

    if (!video_capture.isOpened()) {
        fprintf(stderr, "could not open video %s\n", video_fname.c_str());
        video_capture.release();
        return 1;
    }

    int cap_frame_width = video_capture.get(cv::CAP_PROP_FRAME_WIDTH);
    int cap_frame_height = video_capture.get(cv::CAP_PROP_FRAME_HEIGHT);

    int cap_fps = video_capture.get(cv::CAP_PROP_FPS);
    printf("video info w = %d, h = %d, fps = %d\n", cap_frame_width, cap_frame_height, cap_fps);

    int stream_fps = cap_fps;

    int bitrate = 500000;
    Streamer streamer;
    StreamerConfig streamer_config(cap_frame_width, cap_frame_height,
                                   640, 480,
                                   stream_fps, bitrate, "main", "rtmp://localhost/live/mystream");

    streamer.enable_av_debug_log();

    streamer.init(streamer_config);

    high_resolution_clock clk;
    time_point time_start = clk.now();
    time_point time_prev = time_start;

    cv::Mat read_frame;
    cv::Mat proc_frame;
    bool ok = video_capture.read(read_frame);

    time_point time_stop = clk.now();
    auto elapsed_time = std::chrono::duration_cast<std::chrono::duration<double>>(time_stop - time_start);
    auto frame_time = std::chrono::duration_cast<std::chrono::duration<double>>(time_stop - time_prev);

    Decoder decoder;

    std::cout << "Read to accept frames" << std::endl;

    /**
     * Listen for the result of remote procedure call
     */
    int buffer_size = 1514;
    struct sockaddr_in remote_address;
    socklen_t addrlen = sizeof(remote_address);

    unsigned char receive_buffer[buffer_size];
    while (ok) {
        int receive_length = recvfrom(fd, (void *) receive_buffer, buffer_size,
                                      0, (struct sockaddr *) &remote_address, &addrlen);
        if (receive_length > 0) {
            decoder.H264_2_RGB(receive_buffer, buffer_size);
        }

        process_frame(read_frame, proc_frame);
        stream_frame(streamer, proc_frame, frame_time.count() * streamer.inv_stream_timebase);

        time_stop = clk.now();
        elapsed_time = std::chrono::duration_cast<std::chrono::duration<double>>(time_stop - time_start);
        frame_time = std::chrono::duration_cast<std::chrono::duration<double>>(time_stop - time_prev);

        ok = video_capture.read(read_frame);
        time_prev = time_stop;
    }

    video_capture.release();

    return 0;
}
