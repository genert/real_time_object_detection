#ifndef REAL_TIME_OBJECT_DETECTION_RECEIVER_H
#define REAL_TIME_OBJECT_DETECTION_RECEIVER_H

#include <iostream>

#include <boost/asio.hpp>
#include <boost/array.hpp>
#include <boost/bind.hpp>
#include <opencv2/opencv.hpp>

using boost::asio::ip::udp;
using boost::asio::ip::address;


class Receiver {
    boost::asio::io_service io_service;
    udp::socket socket{io_service};
    boost::array<char, 1024> recv_buffer;
    udp::endpoint remote_endpoint;

public:

    ~Receiver();

    void listen(const boost::asio::ip::address &listen_address, int port);

protected:
    void wait_for_receive_from();

    void handle_receive(const boost::system::error_code &error, size_t bytes_transferred);
};


#endif //REAL_TIME_OBJECT_DETECTION_RECEIVER_H
