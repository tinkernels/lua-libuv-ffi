local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi
local common = require 'lua-libuv-ffi.common'
local req = require 'lua-libuv-ffi.req'

local _Mt = setmetatable({}, { __index = req._Mt })
local _M = setmetatable({ _Mt = _Mt }, { __index = _Mt })

local fs_ctype = common.req_types.FS.ctype
ffi.metatype(fs_ctype, { __index = _Mt })

function _M.new()
    return ffi.new(fs_ctype)
end

function _Mt:req_cleanup()
    return uv_ffi.uv_fs_req_cleanup(self)
end

function _Mt:close(loop, file, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fsclose(loop, self, file, cb_)
end

function _Mt:open(loop, path, flags, mode, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_open(loop, self, path ,flags, mode, cb_)
end

function _Mt:read(loop, file, bufs, nbufs, offset, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_read(loop, self, file, bufs, nbufs, offset ,cb_)
end

function _Mt:unlink(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_unlink(loop, self, path, cb_)
end

function _Mt:write(loop, file, bufs, nbufs, offset, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_write(loop, self, file, bufs, nbufs, offset, cb_)
end

function _Mt:mkdir(loop, path, mode, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_mkdir(loop, self, path, mode, cb_)
end

function _Mt:mkdtemp(loop, tpl, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_mkdtemp(loop, self, tpl, cb_)
end

function _Mt:mkstemp(loop, tpl, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_mkstemp(loop, self, tpl, cb_)
end

function _Mt:rmdir(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_rmdir(loop, self, path, cb_)
end

function _Mt:opendir(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_opendir(loop, self, path, cb_)
end

function _Mt:closedir(loop, dir, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_closedir(loop, self, dir, cb_)
end

function _Mt:readdir(loop, dir, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_readdir(loop, self, dir, cb_)
end

function _Mt:scandir(loop, path, flags, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_scandir(loop, self, path, flags, cb_)
end

function _Mt:scandir_next(ent)
    return uv_ffi.uv_fs_scandir_next(self, ent)
end

function _Mt:stat(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_stat(loop, self, path, cb_)
end

function _Mt:fstat(loop, file, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_fstat(loop, self, file, cb_)
end

function _Mt:lstat(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_lstat(loop, self, path, cb_)
end

function _Mt:statfs(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_statfs(loop, self, path, cb_)
end

function _Mt:rename(loop, path, new_path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_rename(loop, self, path, new_path, cb_)
end

function _Mt:fsync(loop, file, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_fsync(loop, self, file, cb_)
end

function _Mt:fdatasync(loop, file, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_fdatasync(loop, self, file, cb_)
end

function _Mt:ftruncate(loop, file, offset, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_ftruncate(loop, self, file, offset, cb_)
end

function _Mt:copyfile(loop, path, new_path, flags, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_copyfile(loop, self, path, new_path, cb_)
end

function _Mt:sendfile(loop, out_fd, in_fd, in_offset, length, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_sendfile(loop, self, out_fd, in_fd, in_offset, length, cb_)
end

function _Mt:access(loop, path, mode, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_access(loop, self, path, mode, cb_)
end

function _Mt:chmod(loop, path, mode, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_chmod(loop, self, path, mode, cb_)
end

function _Mt:fchmod(loop, file, mode, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_fchmod(loop, self, file, mode, cb)
end

function _Mt:utime(loop, path, atime, mtime, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_utime(loop, self, path, atime, mtime, cb_)
end

function _Mt:futime(loop,file,atime,mtime,cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_futime(loop, self, file, atime, mtime, cb_)
end

function _Mt:lutime(loop, path, atime, mtime, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_lutime(loop, self, path, atime, mtime, cb_)
end

function _Mt:link(loop, path, new_path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_link(loop, self, path, new_path, cb_)
end

function _Mt:symlink(loop, path, new_path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_symlink(loop, self, path, new_path, cb_)
end

function _Mt:readlink(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_readlink(loop, self, path, cb_)
end

function _Mt:realpath(loop, path, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_realpath(loop, self, path, cb_)
end

function _Mt:chown(loop, path, uid, gid, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_chown(loop, self, path, uid, gid, cb_)
end

function _Mt:fchown(loop, file, uid, gid, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_fchown(loop, self, file, uid, gid, cb_)
end

function _Mt:lchown(loop, path, uid, gid, cb)
    local cb_ = ffi.cast(common.callback_types.fs_cb, cb)
    return uv_ffi.uv_fs_lchown(loop, self, path, uid, gid, cb_)
end

function _Mt:get_fstype()
    return uv_ffi.uv_fs_get_type(self)
end

function _Mt:get_result()
    return uv_ffi.uv_fs_get_result(self)
end

function _Mt:get_system_error()
    return uv_ffi.uv_fs_get_system_error(self)
end

function _Mt:get_ptr()
    return uv_ffi.uv_fs_get_ptr(self)
end

function _Mt:get_path()
    return uv_ffi.uv_fs_get_path(self)
end

function _Mt:get_statbuf()
    return uv_ffi.uv_fs_get_statbuf(self)
end

function _M.get_osfhandle(fd)
    return uv_ffi.uv_get_osfhandle(fd)
end

function _M.open_osfhandle(fd)
    return uv_ffi.uv_open_osfhandle(fd)
end

return _M