local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local handle = require 'lua-libuv-ffi.handle'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local timer_ctype = common.handle_types.TIMER.ctype
ffi.metatype(timer_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(timer_ctype)
end

function _Mt:init(loop)
    return uv_ffi.uv_timer_init(loop, self)
end

function _Mt:start(cb, timeout, rpt_interval)
    local cb_ = ffi.cast(common.callback_types.timer_cb, cb)
    return uv_ffi.uv_timer_start(self, cb_, timeout, rpt_interval)
end

function _Mt:stop()
    return uv_ffi.uv_timer_stop(self)
end

function _Mt:again()
    return uv_ffi.uv_timer_again(self)
end

function _Mt:set_repeat(rpt_interval)
    return uv_ffi.uv_timers_set_repeat(self, rpt_interval)
end

function _Mt:get_repeat()
    return uv_ffi.uv_timer_get_repeat(self)
end

function _Mt:get_due_in()
    return uv_ffi.uv_timer_get_due_in(self)
end

return _M
