#include "Decoder.hpp"

Decoder::Decoder() {

}

int Decoder::init() {
    // Use selected codec
    AVCodecID codec_id = AV_CODEC_ID_H264;
    pCodec = avcodec_find_decoder(codec_id);
    if (!pCodec) {
        fprintf(stderr, "Could not find encoder for '%s'\n",
                avcodec_get_name(codec_id));
        return 1;
    }

    // Open the codec
    pCodecCtx = avcodec_alloc_context3(pCodec);
    pCodecCtx->flags |= AV_CODEC_CAP_TRUNCATED;
    if (avcodec_open2(pCodecCtx, pCodec, nullptr) < 0) {
        fprintf(stderr, "Could not open codec for '%s'\n",
                avcodec_get_name(codec_id));
        return 1;
    }

    // Create codec parser for H264
    parser = av_parser_init(codec_id);
    if (!parser) {
        fprintf(stderr, "Could not create parser for '%s'\n",
                avcodec_get_name(codec_id));
        return 1;
    }

    // Allocate video frame
    pFrame = av_frame_alloc();
    if (pFrame == NULL) {
        return -1;
    }

    // Allocate an AVFrame structure
    pFrameRGB = av_frame_alloc();
    if (pFrameRGB == NULL) {
        return -1;
    }

    AVPacket pkt = {0};
    av_init_packet(&pkt);
    this->pkt = &pkt;

    return 0;
}

bool Decoder::is_frame_available() const {
    if (pkt == NULL) {
        return false;
    }

    return pkt->size > 0;
}

ssize_t Decoder::parse(const unsigned char *in_data, ssize_t in_size) {
    return av_parser_parse2(parser, pCodecCtx, &pkt->data, &pkt->size,
                            in_data, in_size,
                            0, 0, AV_NOPTS_VALUE
    );
}

int Decoder::H264_2_RGB(const unsigned char *input_buf, ssize_t frame_size) {
    int numBytes;
    uint8_t *buffer = NULL;
    auto nread = parse(input_buf, frame_size);

    if (!is_frame_available()) {
        return -1;
    }

    int could_decode = 0;
    int av_result = avcodec_decode_video2(pCodecCtx, pFrame, &could_decode, pkt);
    if (av_result < 0) {
        return -1;
    }

    // Determine required buffer size and allocate buffer
    numBytes = avpicture_get_size(AV_PIX_FMT_BGR24, pCodecCtx->width,
                                  pCodecCtx->height);
    buffer = (uint8_t *) malloc(numBytes * sizeof(uint8_t));

    // Assign appropriate parts of buffer to image planes in pFrameRGB
    avpicture_fill((AVPicture *) pFrameRGB, buffer, AV_PIX_FMT_BGR24,
                   pCodecCtx->width, pCodecCtx->height);

    img_convert_ctx = sws_getCachedContext(img_convert_ctx, pCodecCtx->width, pCodecCtx->height,
            //PIX_FMT_YUV420P,pCodecCtx->width,pCodecCtx->height,pCodecCtx->pix_fmt,
                                           pCodecCtx->pix_fmt, pCodecCtx->width, pCodecCtx->height,
                                           AV_PIX_FMT_RGB24,
                                           SWS_X, NULL, NULL, NULL
    );
    if (img_convert_ctx == NULL) {
        printf("can't init convert context!\n");
        return -1;
    }
    pFrame->data[0] += pFrame->linesize[0] * (pCodecCtx->height - 1);
    pFrame->linesize[0] *= -1;
    pFrame->data[1] += pFrame->linesize[1] * (pCodecCtx->height / 2 - 1);;
    pFrame->linesize[1] *= -1;
    pFrame->data[2] += pFrame->linesize[2] * (pCodecCtx->height / 2 - 1);;
    pFrame->linesize[2] *= -1;
    sws_scale(img_convert_ctx, pFrame->data, pFrame->linesize,
              0, 0 - pCodecCtx->width, pFrameRGB->data, pFrameRGB->linesize);

    free(buffer);
    return 0;
}

Decoder::~Decoder() {
    avcodec_close(pCodecCtx);
    av_free(pCodecCtx);
    av_free(pFrame);
    av_free(pFrameRGB);
}
