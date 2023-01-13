local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common_raw'
local req = require 'lua-libuv-ffi.req_raw'

local _Mt = setmetatable({}, { __index = req._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local work_ctype = common.req_types.WORK.ctype
ffi.metatype(work_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(work_ctype)
end

function _Mt:queue_work(loop, work_cb, after_work_cb)
    local work_cb_ = ffi.cast(common.callback_types.work_cb, work_cb)
    local after_work_cb_ = ffi.cast(common.callback_types.after_work_cb, after_work_cb)
    return uv_ffi.uv_queue_work(loop, self, work_cb_, after_work_cb_)
end

return _M