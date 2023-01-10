package = "lua-libuv-ffi"
version = "1.44.3"
source = {
  url = 'git://github.com/tinkernels/lua-libuv-ffi.git'
}
rockspec_format = "3.0"

description = {
  summary = "libuv ffi library for luajit",
  detailed = [[
    libuv ffi library for luajit
  ]],
  homepage = "https://github.com/tinkernels/lua-libuv-ffi",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1",
  "lua-path"
}

build = {
  type = 'cmake',
  variables = {
     CMAKE_C_FLAGS="$(CFLAGS)",
     CMAKE_MODULE_LINKER_FLAGS="$(LIBFLAG)",
     LUA_LIBDIR="$(LUA_LIBDIR)",
     LUA_INCDIR="$(LUA_INCDIR)",
     LUA_LIBFILE="$(LUALIB)",
     LUA="$(LUA)",
     LIBDIR="$(LIBDIR)",
     LUADIR="$(LUADIR)",
  },
  install = {
    lua = {
            ["lua-libuv-ffi/libuv-ffi.so"] = "lua-libuv-ffi/src/lua-libuv-ffi/libuv-ffi.so"
        }
    }
}

test = {
--   type = "command",
--   script = ,
}