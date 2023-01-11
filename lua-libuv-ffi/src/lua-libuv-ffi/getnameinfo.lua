local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local req = require 'lua-libuv-ffi.req'

local _Mt = setmetatable({}, { __index = req._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local getnameinfo_ctype = common.req_types.GETNAMEINFO.ctype
ffi.metatype(getnameinfo_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(getnameinfo_ctype)
end

function _Mt:getnameinfo(loop, getnameinfo_cb, addr, flags)
    local getnameinfo_cb_ = ffi.cast(common.callback_types.getnameinfo_cb, getnameinfo_cb)
    return uv_ffi.uv_getnameinfo(loop, self, getnameinfo_cb_, addr, flags)
end

return _M