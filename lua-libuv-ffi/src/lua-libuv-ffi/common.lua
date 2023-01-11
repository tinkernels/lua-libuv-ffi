local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi

local _M = {}

_M.req_type = {
    REQ = { type = uv_ffi.UV_REQ, ctype = ffi.typeof('uv_req_t') },
    CONNECT = { type = uv_ffi.UV_CONNECT, ctype = ffi.typeof('uv_connect_t') },
    WRITE = { type = uv_ffi.UV_WRITE, ctype = ffi.typeof('uv_write_t') },
    SHUTDOWN = { type = uv_ffi.UV_SHUTDOWN, ctype = ffi.typeof('uv_shutdown_t') },
    UDP_SEND = { type = uv_ffi.UV_UDP_SEND, ctype = ffi.typeof('uv_udp_send_t') },
    FS = { type = uv_ffi.UV_FS, ctype = ffi.typeof('uv_fs_t') },
    WORK = { type = uv_ffi.UV_WORK, ctype = ffi.typeof('uv_work_t') },
    GETADDRINFO = { type = uv_ffi.UV_GETADDRINFO, ctype = ffi.typeof('uv_getaddrinfo_t') },
    GETNAMEINFO = { type = uv_ffi.UV_GETNAMEINFO, ctype = ffi.typeof('uv_getnameinfo_t') },
    RANDOM = { type = uv_ffi.UV_RANDOM, ctype = ffi.typeof('uv_random_t') },
}

_M.handle_type = {
    ASYNC = { type = uv_ffi.UV_ASYNC, ctype = ffi.typeof('uv_async_t') },
    CHECK = { type = uv_ffi.UV_CHECK, ctype = ffi.typeof('uv_check_t') },
    FS_EVENT = { type = uv_ffi.UV_FS_EVENT, ctype = ffi.typeof('uv_fs_event_t') },
    FS_POLL = { type = uv_ffi.UV_FS_POLL, ctype = ffi.typeof('uv_fs_poll_t') },
    HANDLE = { type = uv_ffi.UV_HANDLE, ctype = ffi.typeof('uv_handle_t') },
    IDLE = { type = uv_ffi.UV_IDLE, ctype = ffi.typeof('uv_idle_t') },
    NAMED_PIPE = { type = uv_ffi.UV_NAMED_PIPE, ctype = ffi.typeof('uv_pipe_t') },
    POLL = { type = uv_ffi.UV_POLL, ctype = ffi.typeof('uv_poll_t') },
    PREPARE = { type = uv_ffi.UV_PREPARE, ctype = ffi.typeof('uv_prepare_t') },
    PROCESS = { type = uv_ffi.UV_PROCESS, ctype = ffi.typeof('uv_process_t') },
    STREAM = { type = uv_ffi.UV_STREAM, ctype = ffi.typeof('uv_stream_t') },
    TCP = { type = uv_ffi.UV_TCP, ctype = ffi.typeof('uv_tcp_t') },
    TIMER = { type = uv_ffi.UV_TIMER, ctype = ffi.typeof('uv_timer_t') },
    TTY = { type = uv_ffi.UV_TTY, ctype = ffi.typeof('uv_tty_t') },
    UDP = { type = uv_ffi.UV_UDP, ctype = ffi.typeof('uv_udp_t') },
    SIGNAL = { type = uv_ffi.UV_SIGNAL, ctype = ffi.typeof('uv_signal_t') },
}

function _M.loop_size()
    return uv_ffi.uv_loop_size()
end

function _M.req_size(req_type)
    return uv_ffi.uv_req_size(req_type.type)
end

function _M.handle_size(handle_type)
    return uv_ffi.uv_handle_size(handle_type.type)
end

return _M
