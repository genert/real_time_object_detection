#ifndef REAL_TIME_OBJECT_DETECTION_UDPCLIENT_H
#define REAL_TIME_OBJECT_DETECTION_UDPCLIENT_H

#include <array>
#include <string>
#include <iostream>

#include <unistd.h>
#include <string.h>

#include <sys/socket.h>
#include <netinet/in.h>

#define MAX_SIZE 1514

class UDPClient {
    int m_fd{};
    struct sockaddr_in m_addr{};

public:
    explicit UDPClient(uint16_t port);

    ~UDPClient();

    int connect();

    ssize_t recv(std::array<char, MAX_SIZE> &buf);
};


#endif //REAL_TIME_OBJECT_DETECTION_UDPCLIENT_H
