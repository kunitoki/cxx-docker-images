FROM debian:latest
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

ENV EMCC_SDK_VERSION 1.38.27

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        python \
        gnupg \
        ninja-build \
        ccache \
        curl \
        git \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://cmake.org/files/v3.13/cmake-3.13.2-Linux-x86_64.sh -o /tmp/curl-install.sh \
      && chmod u+x /tmp/curl-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/curl-install.sh

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && curl -LO https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz \
    && tar -zxvf emsdk-portable.tar.gz \
    && rm -rf emsdk-portable.tar.gz \
    && cd emsdk-portable \
    && ./emsdk update \
    && ./emsdk install sdk-${EMCC_SDK_VERSION}-64bit \
    && ./emsdk activate sdk-${EMCC_SDK_VERSION}-64bit \
    && cd ..

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV PATH="/usr/bin/cmake/bin:${PATH}"

CMD ["/bin/bash"]
