local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local handle = require 'lua-libuv-ffi.handle'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local udp_ctype = common.handle_types.UDP.ctype
ffi.metatype(udp_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(udp_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_udp_init(loop, self)
end

function _Mt:open(sock)
    return uv_ffi.uv_udp_open(self, sock)
end

function _Mt:bind(addr, flags)
    return uv_ffi.uv_udp_bind(self, addr, flags)
end

function _Mt:connect(addr)
    return uv_ffi.uv_udp_connect(self, addr)
end

function _Mt:getpeername(name, namelen)
    return uv_ffi.uv_udp_getpeername(self, name, namelen)
end

function _Mt:getsockname(name, namelen)
    return uv_ffi.uv_udp_getsockname(self, name, namelen)
end

function _Mt:set_membership(multicast_addr, interface_addr, membership)
    return uv_ffi.uv_udp_set_membership(self, multicast_addr, interface_addr, membership)
end

function _Mt:set_source_membership(multicast_addr, interface_addr, source_addr, membership)
    return uv_ffi.uv_udp_set_source_membership(self, multicast_addr, source_addr, interface_addr, membership)
end

function _Mt:set_multicast_loop(on)
    return uv_ffi.uv_udp_set_multicast_loop(self, on)
end

function _Mt:set_multicast_ttl(ttl)
    return uv_ffi.uv_udp_set_multicast_ttl(self, ttl)
end

function _Mt:set_multicast_interface(interface_addr)
    return uv_ffi.uv_udp_set_multicast_interface(self, interface_addr)
end

function _Mt:set_broadcast(on)
    return uv_ffi.uv_udp_set_broadcast(self, on)
end

function _Mt:set_ttl(ttl)
    return uv_ffi.uv_udp_set_ttl(self, ttl)
end

function _Mt:send(req, bufs, nbufs, addr, send_cb)
    local cb_ = ffi.cast(common.callback_types.udp_send_cb, send_cb)
    return uv_ffi.uv_udp_send(req, self, bufs, nbufs, addr, cb_)
end

function _Mt:try_send(bufs, nbufs, addr)
    return uv_ffi.uv_udp_try_send(self, bufs, nbufs, addr)
end

function _Mt:recv_start(alloc_cb, recv_cb)
    local alloc_cb_ = ffi.cast(common.callback_types.alloc_cb, alloc_cb)
    local recv_cb_ = ffi.cast(common.callback_types.udp_recv_cb, recv_cb)
    return uv_ffi.uv_udp_recv_start(self, alloc_cb_, recv_cb_)
end

function _Mt:using_recvmmsg()
    return uv_ffi.uv_udp_using_recvmmsg(self)
end

function _Mt:recv_stop()
    return uv_ffi.uv_udp_recv_stop(self)
end

function _Mt:get_send_queue_size()
    return uv_ffi.uv_udp_get_send_queue_size(self)
end

function _Mt:get_send_queue_count()
    return uv_ffi.uv_udp_get_send_queue_size(self)
end

return _M