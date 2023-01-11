local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'

local _mt = {}
local _M = setmetatable({}, { __index = _mt })

local pool_type = ffi.typeof('uv_loop_t')
ffi.metatype(pool_type, { __index = _M })

function _M.default()
    return uv_ffi.uv_default_loop()
end

function _M.new()
    return ffi.new(pool_type)
end

function _mt:init()
    return uv_ffi.uv_loop_init(self)
end

return _M
