local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local handle = require 'lua-libuv-ffi.handle'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local fs_event_ctype = common.handle_types.FS_EVENT.ctype
ffi.metatype(fs_event_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(fs_event_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_fs_event_init(loop, self)
end

function _Mt:start(cb, path, flags)
    local cb_ = ffi.cast(common.callback_types.fs_event_cb, cb)
    return uv_ffi.uv_fs_event_start(self, cb_, path, flags)
end

function _Mt:stop()
    return uv_ffi.uv_fs_event_stop(self)
end

function _Mt:getpath(buffer, size)
    return uv_ffi.uv_fs_event_getpath(self, buffer, size)
end

return _M