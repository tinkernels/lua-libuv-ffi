#ifndef UV_FFI_TYPE_WIN_H
#define UV_FFI_TYPE_WIN_H

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

typedef void* HANDLE;
typedef HANDLE uv_os_fd_t;
typedef unsigned long ULONG;
typedef struct uv_buf_t {
    ULONG len;
    char* base;
} uv_buf_t;

typedef int uv_file;
typedef uintptr_t SOCKET;
typedef SOCKET uv_os_sock_t;
typedef unsigned char uv_uid_t;
typedef unsigned char uv_gid_t;
typedef int uv_pid_t;
struct uv_handle_s {
    void* data;
    uv_loop_t* loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void* handle_queue[2];
    union {
        int fd;
        void* reserved[4];
    } u;
    uv_handle_t* endgame_next;
    unsigned int flags;
};

struct uv_timer_s {
    void* data;
    uv_loop_t* loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void* handle_queue[2];
    union {
        int fd;
        void* reserved[4];
    } u;
    uv_handle_t* endgame_next;
    unsigned int flags;
    void* heap_node[3];
    int unused;
    uint64_t timeout;
    uint64_t repeat;
    uint64_t start_id;
    uv_timer_cb timer_cb;
};

struct uv_prepare_s {
    void* data;
    uv_loop_t* loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void* handle_queue[2];
    union {
        int fd;
        void* reserved[4];
    } u;
    uv_handle_t* endgame_next;
    unsigned int flags;
    uv_prepare_t* prepare_prev;
    uv_prepare_t* prepare_next;
    uv_prepare_cb prepare_cb;
};

struct uv_check_s {
    void* data;
    uv_loop_t* loop;
    uv_handle_type type;
    uv_close_cb close_cb;
    void* handle_queue[2];
    union {
        int fd;
        void* reserved[4];
    } u;
    uv_handle_t* endgame_next;
    unsigned int flags;
    uv_check_t* check_prev;
    uv_check_t* check_next;
    uv_check_cb check_cb;
};
/* <<<<<<<< typedef win variant <<<<<<<< */
#endif

#endif /* UV_FFI_TYPE_WIN_H */