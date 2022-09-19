#!/usr/bin/env bash

set -e

# set EMSDK environment variables
. /emsdk/emsdk_env.sh > /dev/null

# determine EMSCRIPTEN root path
EMSCRIPTEN_COMPILER_PATH=`find /emsdk -name "emcc"`
export EMSCRIPTEN=`dirname $EMSCRIPTEN_COMPILER_PATH`

# export PATH
export PATH="/usr/bin/cmake:${PATH}"

# execute called command
exec "$@"
