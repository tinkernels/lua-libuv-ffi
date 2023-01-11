local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local req = require 'lua-libuv-ffi.req'

local _Mt = {}
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

function _M.new()
    return ffi.new(common.metrics_type.ctype)
end

function _M.metrics_idle_time(loop)
    return uv_ffi.uv_metrics_idle_time(loop)
end

function _Mt:metrics_info(loop)
    return uv_ffi.uv_metrics_info(loop, self)
end