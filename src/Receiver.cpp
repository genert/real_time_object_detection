#include "Receiver.hpp"

Receiver::~Receiver() {
    io_service.stop();
    socket.close();
}

void Receiver::listen(const boost::asio::ip::address &listen_address, int port) {
    socket.open(udp::v4());
    socket.set_option(udp::socket::reuse_address(true));
    socket.bind(udp::endpoint(listen_address, port));

    wait_for_receive_from();

    std::cout << "Receiving\n";
    io_service.run();
    std::cout << "Receiver exit\n";
}


void Receiver::wait_for_receive_from() {
    socket.async_receive_from(
            boost::asio::buffer(recv_buffer),
            remote_endpoint,
            boost::bind(&Receiver::handle_receive,
                        this,
                        boost::asio::placeholders::error,
                        boost::asio::placeholders::bytes_transferred
            )
    );
}

void Receiver::handle_receive(const boost::system::error_code &error, size_t bytes_transferred) {
    if (error) {
        std::cout << "Receive failed: " << error.message() << "\n";
        return;
    }

    std::cout << "Received: '" << std::string(recv_buffer.begin(), recv_buffer.begin() + bytes_transferred) << "' ("
              << error.message() << ")\n";
    wait_for_receive_from();
}