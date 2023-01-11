local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi

local common = require 'lua-libuv-ffi.common'

local _M = {
    ffi = ffi,
    uv_ffi = uv_ffi,
    version = tonumber(uv_ffi.uv_version()),
    version_string = ffi.string(uv_ffi.uv_version_string()),
    req_type = common.req_type,
    req_size = common.req_size,
    handle_type = common.handle_type,
    handle_size = common.handle_size,
    loop_size = common.loop_size,
    loop = require 'lua-libuv-ffi.loop',
    free = uv_ffi.free,
}

return _M