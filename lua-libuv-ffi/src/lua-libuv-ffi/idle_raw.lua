local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local handle = require 'lua-libuv-ffi.handle_raw'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local idle_ctype = common.handle_types.IDLE.ctype
ffi.metatype(idle_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(idle_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_idle_init(loop, self)
end

function _Mt:start(cb)
    local cb_ = ffi.cast(common.callback_types.idle_cb, cb)
    return uv_ffi.uv_idle_start(self, cb_)
end

function _Mt:stop()
    return uv_ffi.uv_idle_stop(self)
end

return _M
