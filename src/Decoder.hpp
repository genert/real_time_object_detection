#ifndef REAL_TIME_OBJECT_DETECTION_DECODER_H
#define REAL_TIME_OBJECT_DETECTION_DECODER_H

extern "C" {
#include <libavcodec/avcodec.h>
#include <libavutil/channel_layout.h>
#include <libavutil/common.h>
#include <libavutil/imgutils.h>
#include <libavutil/mathematics.h>
#include <libavutil/samplefmt.h>

#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
}

class Decoder {
    AVCodec *pCodec = NULL;
    AVCodecContext *pCodecCtx = NULL;
    SwsContext *img_convert_ctx = NULL;
    AVFrame *pFrame = NULL;
    AVFrame *pFrameRGB = NULL;
    AVPacket *pkt = NULL;
    AVCodecParserContext *parser = NULL;

public:
    Decoder();

    ~Decoder();

    int init();

    int H264_2_RGB(const unsigned char *inputbuf, ssize_t frame_size);

protected:
    bool is_frame_available() const;

    ssize_t parse(const unsigned char* in_data, ssize_t in_size);
};

#endif //REAL_TIME_OBJECT_DETECTION_DECODER_H
