local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'

local _Mt = {}
local _M = setmetatable({ default = uv_ffi.uv_default_loop() }, { __index = _Mt })

local pool_ctype = common.loop_type.ctype
ffi.metatype(pool_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(pool_ctype)
end

function _Mt:init()
    return uv_ffi.uv_loop_init(self)
end

function _Mt:uv_loop_configure(option)
    return uv_ffi.uv_loop_configure(self, option)
end

function _Mt:close()
    return uv_ffi.uv_loop_close(self)
end

function _Mt:run(mode)
    return uv_ffi.uv_run(self, mode)
end

function _Mt:is_alive()
    return uv_ffi.uv_loop_alive(self)
end

function _Mt:stop()
    return uv_ffi.uv_stop(self)
end

function _Mt:backend_fd()
    return uv_ffi.uv_backend_fd(self)
end

function _Mt:backend_timeout()
    return uv_ffi.uv_backend_timeout(self)
end

function _Mt:now()
    return uv_ffi.uv_now(self)
end

function _Mt:update_time()
    return uv_ffi.uv_update_time(self)
end

function _Mt:walk(walk_cb, arg)
    local walk_cb_ = ffi.cast(common.callback_types.walk_cb, walk_cb)
    return uv_ffi.uv_walk(self, walk_cb_, arg)
end

function _Mt:fork()
    return uv_ffi.uv_loop_fork(self)
end

function _Mt:get_data()
    return uv_ffi.uv_loop_get_data(self)
end

function _Mt:set_data(data)
    return uv_ffi.uv_loop_set_data(self, data)
end

return _M
