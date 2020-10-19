FROM ubuntu:16.04
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -qq update -y \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        tzdata \
        build-essential \
        python \
        git \
        automake \
        make \
        curl \
        xz-utils \
        zstd \
        zip \
        unzip \
        upx-ucl \
        pkg-config \
        libcurl3-dev \
        libcurl4-openssl-dev \
        libbz2-dev \
        libncurses5-dev \
        liblzma-dev \
        libsqlite3-dev \
        libssl-dev \
        libreadline-dev \
        libgdbm-dev \
        libffi-dev \
        openssl \
        sqlite3 \
        zlib1g-dev \
        uuid-dev \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN curl -SL https://github.com/NixOS/patchelf/archive/master.zip -o patchelf.zip \
    && unzip patchelf.zip \
    && cd patchelf-master \
    && ./bootstrap.sh \
    && ./configure --prefix=/opt/patchelf \
    && make \
    && make install \
    && cd .. \
    && rm -Rf patchelf-master

ENV PATH="/opt/patchelf/bin:${PATH}"
