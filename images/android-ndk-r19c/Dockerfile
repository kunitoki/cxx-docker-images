FROM openjdk:9-jdk
MAINTAINER Lucio Asnaghi <kunitoki@gmail.com>

WORKDIR /opt

ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_NDK /opt/android-ndk-linux
ENV ANDROID_NDK_HOME /opt/android-ndk-linux
ENV PATH "${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/cmake/3.6.4111459/bin"
ENV SDKMANAGER_OPTS "--add-modules java.se.ee"

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        ca-certificates \
        build-essential \
        python3 \
        python3-pip \
        virtualenv \
        zip \
        unzip \
        curl \
        ccache \
        git \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/android-sdk-linux \
    && mkdir -p ~/.android \
    && touch ~/.android/repositories.cfg \
    && cd /opt/android-sdk-linux \
    && curl https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -o sdk-tools.zip \
    && unzip sdk-tools.zip \
    && rm -f sdk-tools.zip \
    && echo y | sdkmanager "build-tools;28.0.2" "platforms;android-28" \
    && echo y | sdkmanager "extras;android;m2repository" "extras;google;m2repository" "extras;google;google_play_services" \
    && sdkmanager "cmake;3.6.4111459"

RUN curl https://dl.google.com/android/repository/android-ndk-r19c-linux-x86_64.zip -o android-ndk.zip \
    && unzip android-ndk.zip \
    && rm -f android-ndk.zip \
    && mv android-ndk-r19c android-ndk-linux
