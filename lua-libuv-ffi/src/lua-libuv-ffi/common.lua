local _uv = require 'lua-libuv-ffi.ffi-loader'
local uv_ffi = _uv.uv_ffi
local ffi = _uv.c_ffi

local _M = {
    loop_type = { ctype = ffi.typeof('uv_loop_t'), cptr_type = ffi.typeof('uv_loop_t*') },
    metrics_type = { ctype = ffi.typeof('uv_metrics_t'), cptr_type = ffi.typeof('uv_metrics_t*') },
}

_M.handle_types = {
    ASYNC = { type = uv_ffi.UV_ASYNC, ctype = ffi.typeof('uv_async_t'), cptr_type = ffi.typeof('uv_async_t*') },
    CHECK = { type = uv_ffi.UV_CHECK, ctype = ffi.typeof('uv_check_t'), cptr_type = ffi.typeof('uv_check_t*') },
    FS_EVENT = { type = uv_ffi.UV_FS_EVENT, ctype = ffi.typeof('uv_fs_event_t'), cptr_type = ffi.typeof('uv_fs_event_t*') },
    FS_POLL = { type = uv_ffi.UV_FS_POLL, ctype = ffi.typeof('uv_fs_poll_t'), cptr_type = ffi.typeof('uv_fs_poll_t*') },
    HANDLE = { type = uv_ffi.UV_HANDLE, ctype = ffi.typeof('uv_handle_t'), cptr_type = ffi.typeof('uv_handle_t*') },
    IDLE = { type = uv_ffi.UV_IDLE, ctype = ffi.typeof('uv_idle_t'), cptr_type = ffi.typeof('uv_idle_t*') },
    NAMED_PIPE = { type = uv_ffi.UV_NAMED_PIPE, ctype = ffi.typeof('uv_pipe_t'), cptr_type = ffi.typeof('uv_pipe_t*') },
    POLL = { type = uv_ffi.UV_POLL, ctype = ffi.typeof('uv_poll_t'), cptr_type = ffi.typeof('uv_poll_t*') },
    PREPARE = { type = uv_ffi.UV_PREPARE, ctype = ffi.typeof('uv_prepare_t'), cptr_type = ffi.typeof('uv_prepare_t*') },
    PROCESS = { type = uv_ffi.UV_PROCESS, ctype = ffi.typeof('uv_process_t'), cptr_type = ffi.typeof('uv_process_t*') },
    STREAM = { type = uv_ffi.UV_STREAM, ctype = ffi.typeof('uv_stream_t'), cptr_type = ffi.typeof('uv_stream_t*') },
    TCP = { type = uv_ffi.UV_TCP, ctype = ffi.typeof('uv_tcp_t'), cptr_type = ffi.typeof('uv_tcp_t*') },
    TIMER = { type = uv_ffi.UV_TIMER, ctype = ffi.typeof('uv_timer_t'), cptr_type = ffi.typeof('uv_timer_t*') },
    TTY = { type = uv_ffi.UV_TTY, ctype = ffi.typeof('uv_tty_t'), cptr_type = ffi.typeof('uv_tty_t*') },
    UDP = { type = uv_ffi.UV_UDP, ctype = ffi.typeof('uv_udp_t'), cptr_type = ffi.typeof('uv_udp_t*') },
    SIGNAL = { type = uv_ffi.UV_SIGNAL, ctype = ffi.typeof('uv_signal_t'), cptr_type = ffi.typeof('uv_signal_t*') },
}

_M.req_types = {
    REQ = { type = uv_ffi.UV_REQ, ctype = ffi.typeof('uv_req_t'), cptr_type = ffi.typeof('uv_req_t*') },
    CONNECT = { type = uv_ffi.UV_CONNECT, ctype = ffi.typeof('uv_connect_t'), cptr_type = ffi.typeof('uv_connect_t*') },
    WRITE = { type = uv_ffi.UV_WRITE, ctype = ffi.typeof('uv_write_t'), cptr_type = ffi.typeof('uv_write_t*') },
    SHUTDOWN = { type = uv_ffi.UV_SHUTDOWN, ctype = ffi.typeof('uv_shutdown_t'), cptr_type = ffi.typeof('uv_shutdown_t*') },
    UDP_SEND = { type = uv_ffi.UV_UDP_SEND, ctype = ffi.typeof('uv_udp_send_t'), cptr_type = ffi.typeof('uv_udp_send_t*') },
    FS = { type = uv_ffi.UV_FS, ctype = ffi.typeof('uv_fs_t'), cptr_type = ffi.typeof('uv_fs_t*') },
    WORK = { type = uv_ffi.UV_WORK, ctype = ffi.typeof('uv_work_t'), cptr_type = ffi.typeof('uv_work_t*') },
    GETADDRINFO = { type = uv_ffi.UV_GETADDRINFO, ctype = ffi.typeof('uv_getaddrinfo_t'),
        cptr_type = ffi.typeof('uv_getaddrinfo_t*') },
    GETNAMEINFO = { type = uv_ffi.UV_GETNAMEINFO, ctype = ffi.typeof('uv_getnameinfo_t'),
        cptr_type = ffi.typeof('uv_getnameinfo_t*') },
    RANDOM = { type = uv_ffi.UV_RANDOM, ctype = ffi.typeof('uv_random_t'), cptr_type = ffi.typeof('uv_random_t*') },
}

_M.callback_types = {
    close_cb = ffi.typeof('uv_close_cb'),
    walk_cb = ffi.typeof('uv_walk_cb'),
    prepare_cb = ffi.typeof('uv_prepare_cb'),
    timer_cb = ffi.typeof('uv_timer_cb'),
    check_cb = ffi.typeof('uv_check_cb'),
    async_cb = ffi.typeof('uv_async_cb'),
    idle_cb = ffi.typeof('uv_idle_cb'),
    poll_cb = ffi.typeof('uv_poll_cb'),
    signal_cb = ffi.typeof('uv_signal_cb'),
    shutdown_cb = ffi.typeof('uv_shutdown_cb'),
    connection_cb = ffi.typeof('uv_connection_cb'),
    alloc_cb = ffi.typeof('uv_alloc_cb'),
    read_cb = ffi.typeof('uv_read_cb'),
    write_cb = ffi.typeof('uv_write_cb'),
    connect_cb = ffi.typeof('uv_connect_cb'),
    udp_send_cb = ffi.typeof('uv_udp_send_cb'),
    udp_recv_cb = ffi.typeof('uv_udp_recv_cb'),
    fs_event_cb = ffi.typeof('uv_fs_event_cb'),
    fs_poll_cb = ffi.typeof('uv_fs_poll_cb'),
    fs_cb = ffi.typeof('uv_fs_cb'),
    work_cb = ffi.typeof('uv_work_cb'),
    after_work_cb = ffi.typeof('uv_after_work_cb'),
    getaddrinfo_cb = ffi.typeof('uv_getaddrinfo_cb'),
    getnameinfo_cb = ffi.typeof('uv_getnameinfo_cb'),
    random_cb = ffi.typeof('uv_random_cb'),
}

function _M.loop_size()
    return uv_ffi.uv_loop_size()
end

function _M.req_size(req_type)
    return uv_ffi.uv_req_size(req_type.type)
end

function _M.handle_size(handle_type)
    return uv_ffi.uv_handle_size(handle_type.type)
end

function _M.guess_handle(file)
    return uv_ffi.uv_guess_handle(file)
end

function _M.replace_allocator(malloc_func, realooc_func, calloc_func, free_func)
    return uv_ffi.uv_replace_allocator(malloc_func, realooc_func, calloc_func, free_func)
end

function _M.library_shutdown()
    return uv_ffi.uv_library_shutdown()
end

function _M.buf_init(base, len)
    return uv_ffi.uv_buf_init(base, len)
end

function _M.setup_args(argc, argv)
    return uv_ffi.uv_setup_args(argc, argv)
end

function _M.get_process_title(buffer, size)
    return uv_ffi.uv_get_process_title(buffer, size)
end

function _M.set_process_title(title)
    return uv_ffi.uv_set_process_title(title)
end

function _M.resideent_set_memory(rss)
    return uv_ffi.uv_resident_set_memory(rss)
end

function _M.uptime(uptime)
    return uv_ffi.uv_uptime(uptime)
end

function _M.getrusage(rusage)
    return uv_ffi.uv_getrusage(rusage)
end

function _M.os_getpid()
    return uv_ffi.uv_os_getpid()
end

function _M.os_getppid()
    return uv_ffi.uv_os_getppid()
end

function _M.available_parallelism()
    return uv_ffi.uv_available_parallelism()
end

function _M.cpu_info(cpu_infos, count)
    return uv_ffi.uv_cpu_info(cpu_infos, count)
end

function _M.free_cpu_info(cpu_infos, count)
    return uv_ffi.uv_free_cpu_info(cpu_infos, count)
end

function _M.cpumask_size()
    return uv_ffi.uv_cpumask_size()
end

function _M.interface_addresses(addresses, count)
    return uv_ffi.uv_interface_addresses(addresses, count)
end

function _M.loadavg(avg)
    return uv_ffi.uv_loadavg(avg)
end

function _M.ip4_addr(ip, port, addr)
    return uv_ffi.uv_ip4_addr(ip, port, addr)
end

function _M.ip6_addr(ip, port, addr)
    return uv_ffi.uv_ip6_addr(ip, port, addr)
end

function _M.ip4_name(src, dst, size)
    return uv_ffi.uv_ip4_name(src, dst, size)
end

function _M.ip6_name(src, dst, size)
    return uv_ffi.uv_ip6_name(src, dst, size)
end

function _M.ip_name(src, dst, size)
    return uv_ffi.uv_ip_name(src, dst, size)
end

function _M.inet_ntop(af, src, dst, size)
    return uv_ffi.uv_inet_ntop(af, src, dst, size)
end

function _M.inet_pton(af, src, dst)
    return uv_ffi.uv_inet_pton(af, src, dst)
end

function _M.if_indextoname(ifindex, buffer, size)
    return uv_ffi.uv_if_indextoname(ifindex, buffer, size)
end

function _M.if_indextoiid(ifindex, buffer, size)
    return uv_ffi.uv_if_indextoiid(ifindex, buffer, size)
end

function _M.exepath(buffer, size)
    return uv_ffi.uv_exepath(buffer, size)
end

function _M.cwd(buffer, size)
    return uv_ffi.uv_cwd(buffer, size)
end

function _M.chdir(dir)
    return uv_ffi.uv_chdir(dir)
end

function _M.os_homedir(buffer, size)
    return uv_ffi.uv_os_homedir(buffer, size)
end

function _M.os_tempdir(buffer, size)
    return uv_ffi.uv_os_tempdir(buffer, size)
end

function _M.os_get_passwd(pwd)
    return uv_ffi.uv_os_get_passwd(pwd)
end

function _M.os_free_passwd(pwd)
    return uv_ffi.uv_os_free_passwd(pwd)
end

function _M.get_free_memory()
    return uv_ffi.uv_get_free_memory()
end

function _M.get_total_memory()
    return uv_ffi.uv_get_total_memory()
end

function _M.uv_get_constrained_memory()
    return uv_ffi.uv_get_constrained_memory()
end

function _M.get_available_memory()
    return uv_ffi.uv_get_available_memory()
end

function _M.hrtime()
    return uv_ffi.uv_hrtime()
end

function _M.os_environ(envitems, count)
    return uv_ffi.uv_os_environ(envitems, count)
end

function _M.os_free_environ(envitems, count)
    return uv_ffi.uv_os_free_environ(envitems, count)
end

function _M.os_getenv(name, buffer, size)
    return uv_ffi.uv_os_getenv(name, buffer, size)
end

function _M.os_setenv(name, value)
    return uv_ffi.uv_os_setenv(name, value)
end

function _M.unsetenv(name)
    return uv_ffi.uv_os_unsetenv(name)
end

function _M.os_gethostname(buffer, size)
    return uv_ffi.uv_os_gethostname(buffer, size)
end

function _M.os_getpriority(pid, priority)
    return uv_ffi.uv_os_getpriority(pid, priority)
end

function _M.os_setpriority(pid, priority)
    return uv_ffi.uv_os_setpriority(pid, priority)
end

function _M.os_uname(buffer)
    return uv_ffi.uv_os_uname(buffer)
end

function _M.gettimeofday(tv)
    return uv_ffi.uv_gettimeofday(tv)
end

function _M.random(loop, req, buf, buflen, flags, cb)
    local cb_ = ffi.cast(_M.callback_types.random_cb, cb)
    return uv_ffi.uv_random(loop, req, buf, buflen, flags, cb_)
end

function _M.leep(msec)
    return uv_ffi.uv_sleep(msec)
end

return _M
