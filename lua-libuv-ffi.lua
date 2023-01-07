local ffi = require 'ffi'
local C = ffi.C
local uv = ffi.load('uv')

ffi.cdef [[

/* >>>>>>>> typedef universe *1* >>>>>>>> */
typedef struct uv_prepare_s uv_prepare_t;
/* <<<<<<<< typedef universe *1* <<<<<<<< */

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
    char* base;
    size_t len;
} uv_buf_t;

typedef int uv_file;
typedef int uv_os_sock_t;
typedef struct uv_poll_s uv_poll_t;
typedef void (*uv_prepare_cb)(uv_prepare_t* handle);
typedef unsigned int uv_uid_t;
typedef unsigned int uv_gid_t;
typedef int uv_pid_t;
struct sockaddr_in;
struct sockaddr_in6
struct struct {} FILE;
/* <<<<<<<< typedef unix variant <<<<<<<< */
]]

local _1 = ffi.typeof('struct sockaddr_in')

local _2 = ffi.new('uv_poll_t')

local _3 = ffi.string(_2.sin_zero)
print''