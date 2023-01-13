local uv = require 'lua-libuv-ffi'
local default_loop = uv.loop_raw.default

local timer_task = uv.timer_raw.new()
local async_task = uv.async_raw.new()

local function async_func(h)
    print('async function fired.')
end

local count = 1
local function timer_func(h)
    print("hello, timer " .. count)
    count = count + 1
    async_task:send()
    if count > 200 then
        timer_task:stop()
        async_task:close()
        timer_task:close()
    end
end

async_task:init(default_loop, async_func)
timer_task:init(default_loop)
timer_task:start(timer_func, 1000, 10)

default_loop:run(uv.UV_RUN_DEFAULT)
default_loop:stop()
print ''
