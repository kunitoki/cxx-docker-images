#!/bin/bash -ex

if ! [ -x "$(docker --version)" ]; then
  echo 'Error: no docker no party !' >&2
  exit 1
fi

if ! [ -x "$(docker-machine --version)" ]; then
  echo 'Error: no docker-machine no party !' >&2
  exit 1
fi

MACHINE_STATUS="$(docker-machine status)"
if [ "${MACHINE_STATUS}" != "Running" ]; then
  docker-machine start
  eval "$(docker-machine env default)"
fi

for IMAGE_NAME in gcc-4 gcc-5 gcc-6 gcc-7 gcc-8 gcc-9 gcc-10; do
  pushd images/${IMAGE_NAME}
  echo "Building image ${IMAGE_NAME} --------------------------------------------"
  docker build --force-rm -t kunitoki/${IMAGE_NAME} .
  echo "Testing image ${IMAGE_NAME} ---------------------------------------------"
  docker run --rm kunitoki/${IMAGE_NAME} cmake --version 
  docker run --rm kunitoki/${IMAGE_NAME} g++ --version
  echo "Publishing image ${IMAGE_NAME} ------------------------------------------"
  docker tag kunitoki/${IMAGE_NAME} kunitoki/${IMAGE_NAME}:latest
  docker push kunitoki/${IMAGE_NAME}
  popd
done

for IMAGE_NAME in clang-3 clang-4 clang-5 clang-6 clang-7 clang-8 clang-9 clang-10; do
  pushd images/${IMAGE_NAME}
  echo "Building image ${IMAGE_NAME} --------------------------------------------"
  docker build --force-rm -t kunitoki/${IMAGE_NAME} .
  echo "Testing image ${IMAGE_NAME} ---------------------------------------------"
  docker run --rm kunitoki/${IMAGE_NAME} cmake --version
  docker run --rm kunitoki/${IMAGE_NAME} clang++ --version
  echo "Publishing image ${IMAGE_NAME} ------------------------------------------"
  docker tag kunitoki/${IMAGE_NAME} kunitoki/${IMAGE_NAME}:latest
  docker push kunitoki/${IMAGE_NAME}
  popd
done

for IMAGE_NAME in emscripten-1.37 emscripten-1.38; do
  pushd images/${IMAGE_NAME}
  echo "Building image ${IMAGE_NAME} --------------------------------------------"
  docker build --force-rm -t kunitoki/${IMAGE_NAME} .
  echo "Testing image ${IMAGE_NAME} ---------------------------------------------"
  docker run --rm kunitoki/${IMAGE_NAME} cmake --version
  docker run --rm kunitoki/${IMAGE_NAME} em++ --version
  echo "Publishing image ${IMAGE_NAME} ------------------------------------------"
  docker tag kunitoki/${IMAGE_NAME} kunitoki/${IMAGE_NAME}:latest
  docker push kunitoki/${IMAGE_NAME}
  popd
done

for IMAGE_NAME in android-ndk-r18b; do
  pushd images/${IMAGE_NAME}
  echo "Building image ${IMAGE_NAME} --------------------------------------------"
  docker build --force-rm -t kunitoki/${IMAGE_NAME} .
  #echo "Testing image ${IMAGE_NAME} ---------------------------------------------"
  #docker run --rm kunitoki/${IMAGE_NAME} cmake --version 
  #docker run --rm kunitoki/${IMAGE_NAME} g++ --version
  echo "Publishing image ${IMAGE_NAME} ------------------------------------------"
  docker tag kunitoki/${IMAGE_NAME} kunitoki/${IMAGE_NAME}:latest
  docker push kunitoki/${IMAGE_NAME}
  popd
done
