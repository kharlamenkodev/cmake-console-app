FROM ubuntu:24.04

ENV HOME /root

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    ca-certificates \
    make \
    git \
    clang \
    clang-format \
    clang-tidy \
    gcc \
    cmake \
    gdb \
    wget \
    libspdlog-dev \
    libcxxopts-dev \
    openssl

RUN mkdir ./temp && cd ./temp && \
    git clone https://github.com/kharlamenkodev/unused.git && \
    cd ./unused && mkdir build && cd build && \
    cmake .. && cmake --build . && cmake --install . && \
    cd ../../../ && rm -r ./temp




