//
// Created by Genert Org on 07.06.2022.
//

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
    explicit UDPClient(uint16_t port) {
        if (m_fd = ::socket(AF_INET, SOCK_STREAM, 0); m_fd == -1) {
            throw std::runtime_error(strerror(errno));
        }

        m_addr.sin_family = AF_INET;
        m_addr.sin_port = htons(port);
        m_addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);

        if (connect() == -1) {
            throw std::runtime_error(strerror(errno));
        }
    }

    ~UDPClient() {
        close(m_fd);
    }

    int connect() {
        return ::connect(
                m_fd,
                reinterpret_cast<struct sockaddr *>(&m_addr),
                sizeof(m_addr)
        );
    }

    ssize_t recv(std::array<char, MAX_SIZE> &buf) {
        return ::recv(
                m_fd,
                buf.data(),
                buf.size() - 1,
                0
        );
    }
};


#endif //REAL_TIME_OBJECT_DETECTION_UDPCLIENT_H
