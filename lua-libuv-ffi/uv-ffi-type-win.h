#ifndef UV_FFI_TYPE_WIN_H
#define UV_FFI_TYPE_WIN_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

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

typedef unsigned long ULONG;

typedef struct uv_buf_t {
    ULONG len;
    char* base;
} uv_buf_t;

typedef unsigned char uv_uid_t;
typedef unsigned char uv_gid_t;

typedef enum {
    UV_UNKNOWN_REQ = 0,
    UV_REQ,
    UV_CONNECT,
    UV_WRITE,
    UV_SHUTDOWN,
    UV_UDP_SEND,
    UV_FS,
    UV_WORK,
    UV_GETADDRINFO,
    UV_GETNAMEINFO,
    UV_RANDOM,
    UV_ACCEPT,
    UV_FS_EVENT_REQ,
    UV_POLL_REQ,
    UV_PROCESS_EXIT,
    UV_READ,
    UV_UDP_RECV,
    UV_WAKEUP,
    UV_SIGNAL_REQ,
    UV_REQ_TYPE_MAX
} uv_req_type;

/* <<<<<<<< typedef win variant <<<<<<<< */

#endif

#endif /* UV_FFI_TYPE_WIN_H */