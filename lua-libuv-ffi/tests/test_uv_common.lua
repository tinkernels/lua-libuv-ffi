local uv = require 'lua-libuv-ffi'
local uv_ffi = uv.uv_ffi
local ffi = uv.ffi
local default_loop = uv.loop.default

print('[loop] size: ' .. tostring(uv.loop_size()))

for k, v in pairs(uv.handle_type) do
    print('[handle] type: ' .. k .. ', size: ' .. tostring(uv.handle_size(v)))
end

for k, v in pairs(uv.req_type) do
    print('[req] type: ' .. k .. ', size: ' .. tostring(uv.req_size(v)))
end

print ''
