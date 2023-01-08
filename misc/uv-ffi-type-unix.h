#ifndef UV_FFI_TYPE_UNIX_H
#define UV_FFI_TYPE_UNIX_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "uv-ffi-type.h"

/* >>>>>>>> typedef unix variant >>>>>>>> */
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
typedef int uv_os_fd_t;
typedef struct uv_buf_t {
    char *base;
    size_t len;
} uv_buf_t;
typedef int uv_file;
typedef int uv_os_sock_t;
typedef unsigned int uv_uid_t;
typedef unsigned int uv_gid_t;
typedef int uv_pid_t;
struct uv_handle_s {
    void *data;
    uv_loop_t *loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void *handle_queue[2];
    union {
        int fd;
        void *reserved[4];
    } u;
    uv_handle_t *next_closing;
    unsigned int flags;
};

struct uv_timer_s {
    void *data;
    uv_loop_t *loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void *handle_queue[2];
    union {
        int fd;
        void *reserved[4];
    } u;
    uv_handle_t *next_closing;
    unsigned int flags;
    uv_timer_cb timer_cb;
    void *heap_node[3];
    uint64_t timeout;
    uint64_t repeat;
    uint64_t start_id;
};

struct uv_prepare_s {
    void *data;
    uv_loop_t *loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void *handle_queue[2];
    union {
        int fd;
        void *reserved[4];
    } u;
    uv_handle_t *next_closing;
    unsigned int flags;
    uv_prepare_cb prepare_cb;
    void *queue[2];
};

struct uv_check_s {
    void *data;
    uv_loop_t *loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void *handle_queue[2];
    union {
        int fd;
        void *reserved[4];
    } u;
    uv_handle_t *next_closing;
    unsigned int flags;
    uv_check_cb check_cb;
    void *queue[2];
};
/* <<<<<<<< typedef unix variant <<<<<<<< */

#endif /* UV_FFI_TYPE_UNIX_H */