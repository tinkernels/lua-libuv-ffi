local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local handle = require 'lua-libuv-ffi.handle_raw'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local stream_ctype = common.handle_types.STREAM.ctype
ffi.metatype(stream_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(stream_ctype)
end

function _Mt:shutdown(req, cb)
    local cb_ = ffi.cast(common.callback_types.shutdown_cb, cb)
    return uv_ffi.uv_shutdown(req, self, cb_)
end

function _Mt:listen(backlog, cb)
    local cb_ = ffi.cast(common.callback_types.connection_cb, cb)
    return uv_ffi.uv_listen(self, backlog, cb_)
end

function _Mt:accept(client)
    return uv_ffi.uv_accept(self, client)
end

function _Mt:read_start(alloc_cb, read_cb)
    local alloc_cb_ = ffi.cast(common.callback_types.alloc_cb, alloc_cb)
    local read_cb_ = ffi.cast(common.callback_types.read_cb, read_cb)
    return uv_ffi.uv_read_start(self, alloc_cb_, read_cb_)
end

function _Mt:read_stop()
    return uv_ffi.uv_read_stop(self)
end

function _Mt:write(req, bufs, nbufs, cb)
    local cb_ = ffi.cast(common.callback_types.write_cb, cb)
    return uv_ffi.uv_write(req, self, bufs, nbufs, cb_)
end

function _Mt:write2(req, bufs, nbufs, send_handle, cb)
    local cb_ = ffi.cast(common.callback_types.write_cb, cb)
    return uv_ffi.uv_write2(req, self, bufs, nbufs, send_handle, cb_)
end

function _Mt:try_write(bufs, nbufs)
    return uv_ffi.uv_try_write(self, bufs, nbufs)
end

function _Mt:is_readable()
    return uv_ffi.uv_is_readable(self)
end

function _Mt:is_writable()
    return uv_ffi.uv_is_writable(self)
end

function _Mt:set_blocing(blocking)
    return uv_ffi.uv_stream_set_blocking(self, blocking)
end

function _Mt:get_write_queue_size()
    return uv_ffi.uv_stream_get_write_queue_size(self)
end

return _M