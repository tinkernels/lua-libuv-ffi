#ifndef UV_FFI_TYPE_WIN_H
#define UV_FFI_TYPE_WIN_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "uv-ffi-type.h"

#ifdef _WIN32

/* >>>>>>>> typedef win variant >>>>>>>> */

typedef void* HANDLE;
typedef uintptr_t SOCKET;
typedef uintptr_t ULONG_PTR;
typedef typedef unsigned long DWORD;
typedef wchar_t WCHAR;
typedef void* PVOID;

typedef SOCKET uv_os_sock_t;
typedef int uv_pid_t;
typedef HANDLE uv_os_fd_t;

/* <<<<<<<< typedef win variant <<<<<<<< */

#endif

#endif /* UV_FFI_TYPE_WIN_H */