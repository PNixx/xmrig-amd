#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p dist-win64
cd dist-win64
x86_64-w64-mingw32.static.posix-cmake ..  -G "Unix Makefiles" \
  -DWITH_AEON=OFF \
  -DXMRIG_DEPS=../xmrig-deps/gcc/x64 \
  -DOpenCL_INCLUDE_DIR=$DIR/APP_SDK/3.0/include \
  -DOpenCL_LIBRARY=$DIR/APP_SDK/3.0/lib/x86_64/libOpenCL.a \
  -DMHD_LIBRARY=../xmrig-deps/gcc/x64/lib/libmicrohttpd.a \
  -DMHD_INCLUDE_DIR=../xmrig-deps/gcc/x64/include \
  -DWITH_HTTPD=OFF \
&& make -j 2
cd ..
