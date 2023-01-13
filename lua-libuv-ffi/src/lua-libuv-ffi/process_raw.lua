local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local handle = require 'lua-libuv-ffi.handle_raw'

local _Mt = setmetatable({}, { __index = handle._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local process_ctype = common.handle_types.PROCESS.ctype
ffi.metatype(process_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(process_ctype)
end

function _M.disable_stdio_inheritance()
    return uv_ffi.uv_disable_stdio_inheritance()
end

function _Mt:spawn(loop, options)
    return uv_ffi.uv_spawn(loop, self, options)
end

return _M