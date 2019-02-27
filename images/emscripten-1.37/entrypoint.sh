#!/bin/bash

set -e

# set EMSDK environment variables
. /emsdk-portable/emsdk_env.sh > /dev/null

exec "$@"
