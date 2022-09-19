#!/usr/bin/env bash

set -e

# determine system node.js
NODE=$(which nodejs)
sed -i "/NODE_JS = .*/NODE_JS = '${NODE}'/" /emsdk/.emscripten

# set EMSDK environment variables
. /emsdk/emsdk_env.sh > /dev/null

# determine EMSCRIPTEN root path
EMSCRIPTEN_COMPILER_PATH=`find /emsdk -name "emcc"`
export EMSCRIPTEN=`dirname $EMSCRIPTEN_COMPILER_PATH`

# execute called command
exec "$@"
