@echo off
chcp 65001 >NUL 2>NUL

cd %~dp0

echo working dir %~dp0

call %~dp0vsenv.cmd 64

cmake -DLIBUV_BUILD_SHARED=ON -DLIBUV_BUILD_TESTS=OFF -DLIBUV_BUILD_BENCH=OFF -DCMAKE_BUILD_TYPE=Release -DUV_FFI_WIN_DLL_NAME=libuv-ffi-winx64 -S%~dp0.. -B%~dp0..\build
cmake --build %~dp0..\build