#ifndef H264DECODER_HPP
#define H264DECODER_HPP

#include <cstdlib>
#include <stdexcept>


extern "C" {
#include <libavcodec/avcodec.h>
#include <libavutil/avutil.h>
#include <libavutil/mem.h>
#include <libswscale/swscale.h>
}

struct AVCodecContext;
struct AVFrame;
struct AVCodec;
struct AVCodecParserContext;
struct SwsContext;
struct AVPacket;

typedef unsigned char ubyte;

class H264Exception : public std::runtime_error {
public:
    H264Exception(const char *s) : std::runtime_error(s) {}
};

class H264InitFailure : public H264Exception {
public:
    H264InitFailure(const char *s) : H264Exception(s) {}
};

class H264DecodeFailure : public H264Exception {
public:
    H264DecodeFailure(const char *s) : H264Exception(s) {}
};


class H264Decoder {
protected:
    /* Persistent things here, using RAII for cleanup. */
    AVCodecContext *context;
    AVFrame *frame;
    AVCodec *codec;
    AVCodecParserContext *parser;
    AVPacket *pkt;

public:
    H264Decoder();

    ~H264Decoder();

    ssize_t parse(const ubyte* in_data, ssize_t in_size);

    bool is_frame_available();

    const AVFrame& decode_frame();
};


#endif

