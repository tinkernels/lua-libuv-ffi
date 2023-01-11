local uv = require 'lua-libuv-ffi'
local uv_ffi = uv.uv_ffi
local ffi = uv.ffi

print('[loop] size: ' .. tostring(uv.loop_size()))

for k, v in pairs(uv.handle_type) do
    print('[handle] type: ' .. k .. ', size: ' .. tostring(uv.handle_size(v)))
end

for k, v in pairs(uv.req_type) do
    print('[req] type: ' .. k .. ', size: ' .. tostring(uv.req_size(v)))
end

local timer = ffi.new(uv.handle_type.TIMER.ctype)
local async_task = ffi.new(uv.handle_type.ASYNC.ctype)
local count = 1
local function time_func(h)
    print("hello, timer " .. count)
    count = count + 1
    uv_ffi.uv_async_send(async_task)
end
uv_ffi.uv_timer_init(uv.loop.default(), timer)
local timer_ret = uv_ffi.uv_timer_start(timer, ffi.cast('uv_timer_cb', time_func), 1000, 1)
local function async_func (h)
    print('async function fired.')
end
uv_ffi.uv_async_init(uv.loop.default(), async_task, ffi.cast('uv_async_cb', async_func))
uv_ffi.uv_run(uv.loop.default(), uv_ffi.UV_RUN_DEFAULT)
print ''
