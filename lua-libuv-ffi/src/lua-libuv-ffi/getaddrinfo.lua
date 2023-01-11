local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local req = require 'lua-libuv-ffi.req'

local _Mt = setmetatable({}, { __index = req._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local getaddrinfo_ctype = common.req_types.GETADDRINFO.ctype
ffi.metatype(getaddrinfo_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(getaddrinfo_ctype)
end

function _Mt:getaddrinfo(loop, getaddrinfo_cb, node, service, hints)
    local getaddrinfo_cb_ = ffi.cast(common.callback_types.getaddrinfo_cb, getaddrinfo_cb)
    return uv_ffi.uv_getaddrinfo(loop, self, getaddrinfo_cb_, node, service, hints)
end

function _Mt:freeaddrinfo()
    return uv_ffi.uv_freeaddrinfo(self)
end

return _M
