local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'

local _Mt = {}
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local handle_ctype = common.handle_types.HANDLE.ctype
ffi.metatype(handle_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(handle_ctype)
end

function _Mt:is_active()
    return uv_ffi.uv_is_active(self)
end

function _Mt:is_closing()
    return uv_ffi.uv_is_closing(self)
end

function _Mt:close(close_cb)
    local close_cb_ = ffi.cast(common.callback_types.close_cb, close_cb)
    local handle_ = ffi.cast(common.handle_types.HANDLE.cptr_type, self)
    return uv_ffi.uv_close(handle_, close_cb_)
end

function _Mt:ref()
    return uv_ffi.uv_ref(self)
end

function _Mt:unref()
    return uv_ffi.uv_unref(self)
end

function _Mt:get_loop()
    return uv_ffi.uv_handle_get_loop(self)
end

function _Mt:get_data()
    return uv_ffi.uv_handle_get_data(self)
end

function _Mt:set_data(data)
    return uv_ffi.uv_handle_set_data(self, data)
end

function _Mt:get_type()
    return uv_ffi.uv_handle_get_type(self)
end

function _M.type_name(type)
    return uv_ffi.uv_handle_type_name(type)
end

return _M
