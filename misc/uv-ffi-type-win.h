#ifndef UV_FFI_TYPE_WIN_H
#define  UV_FFI_TYPE_WIN_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "uv-ffi-type.h"

#ifdef _WIN32
/* >>>>>>>> typedef win variant >>>>>>>> */
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

typedef void *HANDLE;
typedef HANDLE uv_os_fd_t;
typedef unsigned long ULONG;
typedef struct uv_buf_t {
    ULONG len;
    char *base;
} uv_buf_t;

typedef int uv_file;
typedef uintptr_t SOCKET;
typedef SOCKET uv_os_sock_t;
typedef unsigned char uv_uid_t;
typedef unsigned char uv_gid_t;
typedef int uv_pid_t;
/* FIX: type uv_mutex_t */
/* FIX: type uv_sem_t */
/* FIX: type uv_rwlock_t */
/* FIX: type uv_cond_t */
/* FIX: type uv_barrier_t */
/* FIX: type uv_once_t */
/* FIX: type uv_key_t */
/* <<<<<<<< typedef win variant <<<<<<<< */
#endif

#endif /* UV_FFI_TYPE_WIN_H */