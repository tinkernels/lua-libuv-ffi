local uv = require 'lua-libuv-ffi'
local ffi2 = require 'ffi'
print(ffi2.string(uv.uv_ffi.uv_version_string()))
local uv2_ffi = ffi2.load 'uv'
local uv_ffi = uv.uv_ffi
print(ffi2.string(uv2_ffi.uv_ffi.uv_version_string()))
local ffi = uv.ffi
local default_loop = uv.loop_raw.default

print('[loop] size: ' .. tostring(uv.loop_size()))

for k, v in pairs(uv.handle_type) do
    print('[handle] type: ' .. k .. ', size: ' .. tostring(uv.handle_size(v)))
end

for k, v in pairs(uv.req_type) do
    print('[req] type: ' .. k .. ', size: ' .. tostring(uv.req_size(v)))
end

print ''
