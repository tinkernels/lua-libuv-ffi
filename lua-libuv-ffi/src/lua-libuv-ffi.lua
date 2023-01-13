local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi

local common = require 'lua-libuv-ffi.common_raw'

local _M = {
    ffi = ffi,
    uv_ffi = uv_ffi,
    version = tonumber(uv_ffi.uv_version()),
    version_string = ffi.string(uv_ffi.uv_version_string()),
    req_type = common.req_types,
    req_size = common.req_size,
    handle_type = common.handle_types,
    handle_size = common.handle_size,
    loop_size = common.loop_size,
    free = uv_ffi.free,
    UV_RUN_DEFAULT = uv_ffi.UV_RUN_DEFAULT,
    UV_RUN_ONCE = uv_ffi.UV_RUN_ONCE,
    UV_RUN_NOWAIT = uv_ffi.UV_RUN_NOWAIT,
    loop_raw = require 'lua-libuv-ffi.loop_raw',
    handle_raw = require 'lua-libuv-ffi.handle_raw',
    req_raw = require 'lua-libuv-ffi.req_raw',
    timer_raw = require 'lua-libuv-ffi.timer_raw',
    prepare_raw = require 'lua-libuv-ffi.prepare_raw',
    check_raw = require 'lua-libuv-ffi.check_raw',
    async_raw = require 'lua-libuv-ffi.async_raw',
    idle_raw = require 'lua-libuv-ffi.idle_raw',
    poll_raw = require 'lua-libuv-ffi.poll_raw',
    signal_raw = require 'lua-libuv-ffi.signal_raw',
    process_raw = require 'lua-libuv-ffi.process_raw',
    stream_raw = require 'lua-libuv-ffi.stream_raw',
    tcp_raw = require 'lua-libuv-ffi.tcp_raw',
    pipe_raw = require 'lua-libuv-ffi.pipe_raw',
    tty_raw = require 'lua-libuv-ffi.tty_raw',
    udp_raw = require 'lua-libuv-ffi.udp_raw',
    fs_event_raw = require 'lua-libuv-ffi.fs_event_raw',
    fs_poll_raw = require 'lua-libuv-ffi.fs_poll_raw',
    fs_raw = require 'lua-libuv-ffi.fs_raw',
    threadpool_raw = require 'lua-libuv-ffi.threadpool_raw',
    getaddrinfo_raw = require 'lua-libuv-ffi.getaddrinfo_raw',
    getnameinfo_raw = require 'lua-libuv-ffi.getnameinfo_raw',
    metrics_raw = require 'lua-libuv-ffi.metrics_raw',
}

return _M
