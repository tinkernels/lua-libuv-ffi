local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local stream = require 'lua-libuv-ffi.stream'

local _Mt = setmetatable({}, { __index = stream._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local pipe_ctype = common.handle_types.NAMED_PIPE.ctype
ffi.metatype(pipe_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(pipe_ctype)
end

function _Mt:init(loop, ipc)
    return uv_ffi.uv_pipe_Init(loop, self, ipc)
end

function _Mt:open(file)
    return uv_ffi.uv_pipe_open(self, file)
end

function _Mt:bind(name)
    return uv_ffi.uv_pipe_bind(self, name)
end

function _Mt:connect(req, name, cb)
    local cb_ = ffi.cast(common.callback_types.connect_cb, cb)
    return uv_ffi.uv_pipe_connecct(req, self, name, cb_)
end

function _Mt:getsockname(buffer, size)
    return uv_ffi.uv_pipe_getsockname(self, buffer, size)
end

function _Mt:getpeername(buffer, size)
    return uv_ffi.uv_pipe_getpeername(self, buffer, size)
end

function _Mt:pending_instances(count)
    return uv_ffi.uv_pipe_pending_instances(self, count)
end

function _Mt:peinding_count()
    return uv_ffi.uv_pipe_pending_count(self)
end

function _Mt:chmod(flags)
    return uv_ffi.uv_pipe_chmod(self, flags)
end

function _M.pipe(fds, read_flags, write_flags)
    return uv_ffi.uv_pipe(fds, read_flags, write_flags)
end

return _M
