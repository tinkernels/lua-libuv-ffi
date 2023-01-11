local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local handle = require 'lua-libuv-ffi.handle'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local signal_ctype = common.handle_types.SIGNAL.ctype
ffi.metatype(signal_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(signal_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_signal_init(loop, self)
end

function _Mt:start(cb ,signum)
    local cb_ = ffi.cast(common.callback_types.signal_cb, cb)
    return uv_ffi.uv_signal_start(self, cb_, signum)
end

function _Mt:start_oneshot(cb, signum)
    local cb_ = ffi.cast(common.callback_types.signal_cb, cb)
    return uv_ffi.uv_signal_start_oneshot(self, cb_, signum)
end

function _Mt:stop()
    return uv_ffi.uv_signal_stop(self)    
end

return _M