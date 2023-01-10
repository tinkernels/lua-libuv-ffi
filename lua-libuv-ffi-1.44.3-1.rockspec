package         = "lua-libuv-ffi"
version         = "1.44.3-1"
source          = {
    url = 'git://github.com/tinkernels/lua-libuv-ffi.git'
}
rockspec_format = "3.0"

description = {
    summary = "libuv ffi library for luajit",
    detailed = [[
    libuv ffi library for luajit
  ]] ,
    homepage = "https://github.com/tinkernels/lua-libuv-ffi",
    license = "MIT"
}

dependencies = {
    "lua >= 5.1",
    "lua-path"
}

build = {
    install = {
        lua = {
            ["lua-libuv-ffi"]            = "lua-libuv-ffi/src/lua-libuv-ffi.lua",
            ["lua-libuv-ffi.libuv-ffi"]  = "lua-libuv-ffi/src/lua-libuv-ffi/libuv-ffi.so",
            ["lua-libuv-ffi.ffi-loader"] = "lua-libuv-ffi/src/lua-libuv-ffi/ffi-loader.lua",
            ["lua-libuv-ffi.loop"]       = "lua-libuv-ffi/src/lua-libuv-ffi/loop.lua",
        }
    },
    platforms = {
        windows = {
            type = 'command',
            build_command = "cmd /c lua-libuv-ffi/build.cmd",
            install_command = "cmd /c echo '**- SKIP-CMAKE-INSTALL -**'"
        },
        unix = {
            type = 'cmake',
            variables = {
                CMAKE_INSTALL_PREFIX = "$(PREFIX)",
                LIBUV_BUILD_SHARED = "ON",
                LIBUV_BUILD_TESTS = "OFF",
                LIBUV_BUILD_BENCH = "OFF"
            },
        }
    }
}
