#include "h264decoder.hpp"

H264Decoder::H264Decoder() {
    codec = (AVCodec *) avcodec_find_decoder(AV_CODEC_ID_H264);
    if (!codec)
        throw H264InitFailure("cannot find decoder");

    context = avcodec_alloc_context3(codec);
    if (!context)
        throw H264InitFailure("cannot allocate context");

    if (codec->capabilities & AV_CODEC_CAP_TRUNCATED) {
        context->flags |= AV_CODEC_CAP_TRUNCATED;
    }

    int err = avcodec_open2(context, codec, nullptr);
    if (err < 0)
        throw H264InitFailure("cannot open context");

    parser = av_parser_init(AV_CODEC_ID_H264);
    if (!parser)
        throw H264InitFailure("cannot init parser");

    frame = av_frame_alloc();
    if (!frame)
        throw H264InitFailure("cannot allocate frame");

#if 1
    pkt = new AVPacket;
    if (!pkt)
        throw H264InitFailure("cannot allocate packet");
    av_init_packet(pkt);
#endif
}

H264Decoder::~H264Decoder() {
    av_parser_close(parser);
    avcodec_close(context);
    av_free(context);
    av_frame_free(&frame);
#if 1
    delete pkt;
#endif
}

ssize_t H264Decoder::parse(const ubyte *in_data, ssize_t in_size) {
    auto nread = av_parser_parse2(parser, context, &pkt->data, &pkt->size,
                                  in_data, in_size,
                                  0, 0, AV_NOPTS_VALUE);
    return nread;
}

bool H264Decoder::is_frame_available() {
    return pkt->size > 0;
}

const AVFrame &H264Decoder::decode_frame() {
    int got_picture = 0;
    int nread = avcodec_decode_video2(context, frame, &got_picture, pkt);
    if (nread < 0 || got_picture == 0)
        throw H264DecodeFailure("error decoding frame\n");
    return *frame;
}