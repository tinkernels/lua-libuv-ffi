#ifndef UV_FFI_TYPE_UNIX_H
#define UV_FFI_TYPE_UNIX_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* >>>>>>>> typedef unix variant >>>>>>>> */

typedef int uv_os_fd_t;
typedef int uv_os_sock_t;
typedef int uv_pid_t;

typedef struct uv_buf_t {
    char *base;
    size_t len;
} uv_buf_t;

typedef unsigned int uv_uid_t;
typedef unsigned int uv_gid_t;

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
    UV_REQ_TYPE_MAX
} uv_req_type;
/* <<<<<<<< typedef unix variant <<<<<<<< */

#endif /* UV_FFI_TYPE_UNIX_H */