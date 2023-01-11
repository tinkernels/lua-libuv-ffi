local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi

local common = require 'lua-libuv-ffi.common'

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
    loop = require 'lua-libuv-ffi.loop',
    handle = require 'lua-libuv-ffi.handle',
    req = require 'lua-libuv-ffi.req',
    timer = require 'lua-libuv-ffi.timer',
    prepare = require 'lua-libuv-ffi.prepare',
    check = require 'lua-libuv-ffi.check',
    async = require 'lua-libuv-ffi.async',
    idle = require 'lua-libuv-ffi.idle',
    poll = require 'lua-libuv-ffi.poll',
    signal = require 'lua-libuv-ffi.signal',
    process = require 'lua-libuv-ffi.process',
    stream = require 'lua-libuv-ffi.stream',
    tcp = require 'lua-libuv-ffi.tcp',
    pipe = require 'lua-libuv-ffi.pipe',
    tty = require 'lua-libuv-ffi.tty',
    udp = require 'lua-libuv-ffi.udp',
    fs_poll = require 'lua-libuv-ffi.fs_poll',
    fs = require 'lua-libuv-ffi.fs',
    threadpool = require 'lua-libuv-ffi.threadpool',
    getaddrinfo = require 'lua-libuv-ffi.getaddrinfo',
    getnameinfo = require '',
    metrics = require 'lua-libuv-ffi.metrics',
}

return _M
