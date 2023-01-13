local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'

local _Mt = {}
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local req_ctype = common.req_types.REQ.ctype
ffi.metatype(req_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(req_ctype)
end

function _Mt:cancle()
    return uv_ffi.uv_cancle(self)
end

function _Mt:get_data()
    return uv_ffi.uv_req_get_data(self)
end

function _Mt:set_data(data)
    return uv_ffi.uv_req_set_data(self, data)
end

function _Mt:get_type()
    return uv_ffi.uv_req_get_type(self)
end

function _M.type_name(type)
    return uv_ffi.uv_req_type_name(type)
end

return _M
