local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local handle = require 'lua-libuv-ffi.handle_raw'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local prepare_ctype = common.handle_types.PREPARE.ctype
ffi.metatype(prepare_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(prepare_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_prepare_init(loop, self)
end

function _Mt:start(cb)
    local cb_ = ffi.cast(common.callback_types.prepare_cb, cb)
    return uv_ffi.uv_prepare_start(self, cb_)
end

function _Mt:stop()
    return uv_ffi.uv_prepare_stop(self)
end

function _Mt:kill(signum)
    return uv_ffi.uv_process_kill(self, signum)
end

function _M.pkill(pid, signum)
    return uv_ffi.uv_process_kill(pid, signum)
end

function _Mt:get_pid()
    return uv_ffi.uv_process_get_pid(self)
end

return _M
