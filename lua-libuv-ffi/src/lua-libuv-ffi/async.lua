local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local handle = require 'lua-libuv-ffi.handle'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local async_ctype = common.handle_types.ASYNC.ctype
ffi.metatype(async_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(async_ctype)
end

function _Mt:init(loop, async_cb)
    local cb_ = ffi.cast(common.callback_types.async_cb, async_cb)
    return uv_ffi.uv_async_init(loop, self, cb_)
end

function _Mt:send()
    return uv_ffi.uv_async_send(self)
end

return _M
