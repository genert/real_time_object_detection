//
// Created by Genert Org on 07.06.2022.
//

#include "udpclient.h"

UDPClient::UDPClient(uint16_t port) {
    // Create UDP socket
    if (m_fd = ::socket(AF_INET, SOCK_DGRAM, 0); m_fd < 0) {
        throw std::runtime_error(strerror(errno));
    }

    m_addr.sin_family = AF_INET;
    m_addr.sin_port = htons(port);
    m_addr.sin_addr.s_addr = htonl(INADDR_ANY);

    if (connect() == -1) {
        throw std::runtime_error(strerror(errno));
    }
}

UDPClient::~UDPClient() {
    close(m_fd);
}

int UDPClient::connect() {
    return ::connect(
            m_fd,
            reinterpret_cast<struct sockaddr *>(&m_addr),
            sizeof(m_addr)
    );
}

ssize_t UDPClient::recv(std::array<char, MAX_SIZE> &buf) {
    return ::recv(
            m_fd,
            buf.data(),
            buf.size() - 1,
            0
    );
}