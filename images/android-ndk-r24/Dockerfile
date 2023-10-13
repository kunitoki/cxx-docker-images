FROM kunitoki/android-base:latest
LABEL maintainer="Lucio Asnaghi <kunitoki@gmail.com>"

ARG NDK_VERSION=24.0.8215888

ENV ANDROID_NDK /opt/android-sdk-linux/ndk/${NDK_VERSION}
ENV ANDROID_NDK_HOME /opt/android-sdk-linux/ndk/${NDK_VERSION}

RUN yes | sdkmanager "ndk;${NDK_VERSION}"
