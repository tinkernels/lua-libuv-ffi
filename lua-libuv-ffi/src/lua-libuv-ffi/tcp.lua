local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local stream = require 'lua-libuv-ffi.stream'

local _Mt = setmetatable({}, { __index = stream._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local tcp_ctype = common.handle_types.TCP.ctype
ffi.metatype(tcp_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(tcp_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_tcp_init(loop, self)
end

function _Mt:init_ex(loop, flags)
    return uv_ffi.uv_tcp_init_ex(loop, self, flags)
end

function _Mt:open(sock)
    return uv_ffi.uv_tcp_open(self, sock)
end

function _Mt:nodelay(enable)
    return uv_ffi.uv_tcp_nodelay(self, enable)
end

function _Mt:keepalive(enable, delay)
    return uv_ffi.uv_tcp_keepalive(self, enable, delay)
end

function _Mt:simultaneous_accept(enable)
    return uv_ffi.uv_tcp_simultaneous_accepts(self, enable)
end

function _Mt:bind(addr, flags)
    return uv_ffi.uv_tcp_bind(self, addr, flags)
end

function _Mt:getsockname(name, namelen)
    return uv_ffi.uv_tcp_getsockname(self, name, namelen)
end

function _Mt:connect(req, addr, cb)
    local cb_ = ffi.cast(common.callback_types.connect_cb, cb)
    return uv_ffi.uv_tcp_connect(req, self, addr, cb_)
end

function _Mt:close_reset(close_cb)
    local cb_ = ffi.cast(common.callback_types.close_cb, close_cb)
    return uv_ffi.uv_tcp_close_reset(self, cb_)
end

function _M.socketpair(type, protocol, socket_vector, flags0, flags1)
    return uv_ffi.uv_socketpair(type, protocol, socket_vector, flags0, flags1)
end

return _M
