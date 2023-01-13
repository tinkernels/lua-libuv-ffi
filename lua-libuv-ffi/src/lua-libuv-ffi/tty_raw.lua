local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local stream = require 'lua-libuv-ffi.stream_raw'

local _Mt = setmetatable({}, { __index = stream._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local tty_ctype = common.handle_types.TTY.ctype
ffi.metatype(tty_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(tty_ctype)
end

function _Mt:init(loop, fd, unused)
    return uv_ffi.uv_tty_init(loop, self, fd, unused)
end

function _Mt:set_mode(mode)
    return uv_ffi.uv_tty_set_mode(mode)
end

function _Mt:reset_mode()
    return uv_ffi.uv_tty_reset_mode()    
end

function _Mt:get_win_size(width, heigth)
    return uv_ffi.uv_tty_get_winsize(self, width, heigth)
end

function _M.set_vterm_state(state)
    return uv_ffi.uv_tty_set_vterm_state(state)
end

function _M.get_vterm_state(state)
    return uv_ffi.uv_tty_get_vterm_state(state)
end

return _M
