#ifndef UV_FFI_FUNCTION_H
#define UV_FFI_FUNCTION_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "uv-ffi-type.h"
#include "uv-ffi-type-win.h"
#include "uv-ffi-type-unix.h"

/* >>>>>>>> function >>>>>>>> */
unsigned int uv_version(void);

const char *uv_version_string(void);

void uv_library_shutdown(void);

int uv_replace_allocator(uv_malloc_func malloc_func,
                         uv_realloc_func realloc_func,
                         uv_calloc_func calloc_func,
                         uv_free_func free_func);

uv_loop_t *uv_default_loop(void);

int uv_loop_init(uv_loop_t *loop);

int uv_loop_close(uv_loop_t *loop);

size_t uv_loop_size(void);

int uv_loop_alive(const uv_loop_t *loop);

int uv_loop_configure(uv_loop_t *loop, uv_loop_option option, ...);

int uv_loop_fork(uv_loop_t *loop);

int uv_run(uv_loop_t *, uv_run_mode mode);

void uv_stop(uv_loop_t *);

void uv_ref(uv_handle_t *);

void uv_unref(uv_handle_t *);

int uv_has_ref(const uv_handle_t *);

void uv_update_time(uv_loop_t *);

uint64_t uv_now(const uv_loop_t *);

int uv_backend_fd(const uv_loop_t *);

int uv_backend_timeout(const uv_loop_t *);

int uv_translate_sys_error(int sys_errno);

const char *uv_strerror(int err);

char *uv_strerror_r(int err, char *buf, size_t buflen);

const char *uv_err_name(int err);

char *uv_err_name_r(int err, char *buf, size_t buflen);

int uv_shutdown(uv_shutdown_t *req,
                uv_stream_t *handle,
                uv_shutdown_cb cb);

size_t uv_handle_size(uv_handle_type type);

uv_handle_type uv_handle_get_type(const uv_handle_t *handle);

const char *uv_handle_type_name(uv_handle_type type);

void *uv_handle_get_data(const uv_handle_t *handle);

uv_loop_t *uv_handle_get_loop(const uv_handle_t *handle);

void uv_handle_set_data(uv_handle_t *handle, void *data);

size_t uv_req_size(uv_req_type type);

void *uv_req_get_data(const uv_req_t *req);

void uv_req_set_data(uv_req_t *req, void *data);

uv_req_type uv_req_get_type(const uv_req_t *req);

const char *uv_req_type_name(uv_req_type type);

int uv_is_active(const uv_handle_t *handle);

void uv_walk(uv_loop_t *loop, uv_walk_cb walk_cb, void *arg);

void uv_print_all_handles_lua(uv_loop_t *loop, void *stream);

void uv_print_active_handles_lua(uv_loop_t *loop, void *stream);

void uv_close(uv_handle_t *handle, uv_close_cb close_cb);

int uv_send_buffer_size(uv_handle_t *handle, int *value);

int uv_recv_buffer_size(uv_handle_t *handle, int *value);

int uv_fileno(const uv_handle_t *handle, uv_os_fd_t *fd);

uv_buf_t uv_buf_init(char *base, unsigned int len);

int uv_pipe(uv_file fds[2], int read_flags, int write_flags);

int uv_socketpair(int type,
                  int protocol,
                  uv_os_sock_t socket_vector[2],
                  int flags0,
                  int flags1);

size_t uv_stream_get_write_queue_size(const uv_stream_t *stream);

int uv_listen(uv_stream_t *stream, int backlog, uv_connection_cb cb);

int uv_accept(uv_stream_t *server, uv_stream_t *client);

int uv_read_start(uv_stream_t *,
                  uv_alloc_cb alloc_cb,
                  uv_read_cb read_cb);

int uv_read_stop(uv_stream_t *);

int uv_write(uv_write_t *req,
             uv_stream_t *handle,
             const uv_buf_t bufs[],
             unsigned int nbufs,
             uv_write_cb cb);

int uv_write2(uv_write_t *req,
              uv_stream_t *handle,
              const uv_buf_t bufs[],
              unsigned int nbufs,
              uv_stream_t *send_handle,
              uv_write_cb cb);

int uv_try_write(uv_stream_t *handle,
                 const uv_buf_t bufs[],
                 unsigned int nbufs);

int uv_try_write2(uv_stream_t *handle,
                  const uv_buf_t bufs[],
                  unsigned int nbufs,
                  uv_stream_t *send_handle);

int uv_is_readable(const uv_stream_t *handle);

int uv_is_writable(const uv_stream_t *handle);

int uv_stream_set_blocking(uv_stream_t *handle, int blocking);

int uv_is_closing(const uv_handle_t *handle);

int uv_tcp_init(uv_loop_t *, uv_tcp_t *handle);

int uv_tcp_init_ex(uv_loop_t *, uv_tcp_t *handle, unsigned int flags);

int uv_tcp_open(uv_tcp_t *handle, uv_os_sock_t sock);

int uv_tcp_nodelay(uv_tcp_t *handle, int enable);

int uv_tcp_keepalive(uv_tcp_t *handle,
                     int enable,
                     unsigned int delay);

int uv_tcp_simultaneous_accepts(uv_tcp_t *handle, int enable);

int uv_tcp_bind(uv_tcp_t *handle,
                const struct sockaddr *addr,
                unsigned int flags);

int uv_tcp_getsockname(const uv_tcp_t *handle,
                       struct sockaddr *name,
                       int *namelen);

int uv_tcp_getpeername(const uv_tcp_t *handle,
                       struct sockaddr *name,
                       int *namelen);

int uv_tcp_close_reset(uv_tcp_t *handle, uv_close_cb close_cb);

int uv_tcp_connect(uv_connect_t *req,
                   uv_tcp_t *handle,
                   const struct sockaddr *addr,
                   uv_connect_cb cb);

int uv_udp_init(uv_loop_t *, uv_udp_t *handle);

int uv_udp_init_ex(uv_loop_t *, uv_udp_t *handle, unsigned int flags);

int uv_udp_open(uv_udp_t *handle, uv_os_sock_t sock);

int uv_udp_bind(uv_udp_t *handle,
                const struct sockaddr *addr,
                unsigned int flags);

int uv_udp_connect(uv_udp_t *handle, const struct sockaddr *addr);

int uv_udp_getpeername(const uv_udp_t *handle,
                       struct sockaddr *name,
                       int *namelen);

int uv_udp_getsockname(const uv_udp_t *handle,
                       struct sockaddr *name,
                       int *namelen);

int uv_udp_set_membership(uv_udp_t *handle,
                          const char *multicast_addr,
                          const char *interface_addr,
                          uv_membership membership);

int uv_udp_set_multicast_loop(uv_udp_t *handle, int on);

int uv_udp_set_multicast_ttl(uv_udp_t *handle, int ttl);

int uv_udp_set_multicast_interface(uv_udp_t *handle,
                                   const char *interface_addr);

int uv_udp_set_broadcast(uv_udp_t *handle, int on);

int uv_udp_set_ttl(uv_udp_t *handle, int ttl);

int uv_udp_send(uv_udp_send_t *req,
                uv_udp_t *handle,
                const uv_buf_t bufs[],
                unsigned int nbufs,
                const struct sockaddr *addr,
                uv_udp_send_cb send_cb);

int uv_udp_try_send(uv_udp_t *handle,
                    const uv_buf_t bufs[],
                    unsigned int nbufs,
                    const struct sockaddr *addr);

int uv_udp_recv_start(uv_udp_t *handle,
                      uv_alloc_cb alloc_cb,
                      uv_udp_recv_cb recv_cb);

int uv_udp_using_recvmmsg(const uv_udp_t *handle);

int uv_udp_recv_stop(uv_udp_t *handle);

size_t uv_udp_get_send_queue_size(const uv_udp_t *handle);

size_t uv_udp_get_send_queue_count(const uv_udp_t *handle);

int uv_tty_init(uv_loop_t *, uv_tty_t *, uv_file fd, int readable);

int uv_tty_set_mode(uv_tty_t *, uv_tty_mode_t mode);

int uv_tty_reset_mode(void);

int uv_tty_get_winsize(uv_tty_t *, int *width, int *height);

void uv_tty_set_vterm_state(uv_tty_vtermstate_t state);

int uv_tty_get_vterm_state(uv_tty_vtermstate_t *state);

uv_handle_type uv_guess_handle(uv_file file);

int uv_pipe_init(uv_loop_t *, uv_pipe_t *handle, int ipc);

int uv_pipe_open(uv_pipe_t *, uv_file file);

int uv_pipe_bind(uv_pipe_t *handle, const char *name);

void uv_pipe_connect(uv_connect_t *req,
                     uv_pipe_t *handle,
                     const char *name,
                     uv_connect_cb cb);

int uv_pipe_getsockname(const uv_pipe_t *handle,
                        char *buffer,
                        size_t *size);

int uv_pipe_getpeername(const uv_pipe_t *handle,
                        char *buffer,
                        size_t *size);

void uv_pipe_pending_instances(uv_pipe_t *handle, int count);

int uv_pipe_pending_count(uv_pipe_t *handle);

uv_handle_type uv_pipe_pending_type(uv_pipe_t *handle);

int uv_pipe_chmod(uv_pipe_t *handle, int flags);

int uv_pipe_chmod(uv_pipe_t *handle, int flags);

int uv_poll_init(uv_loop_t *loop, uv_poll_t *handle, int fd);

int uv_poll_init_socket(uv_loop_t *loop,
                        uv_poll_t *handle,
                        uv_os_sock_t socket);

int uv_poll_start(uv_poll_t *handle, int events, uv_poll_cb cb);

int uv_poll_stop(uv_poll_t *handle);

int uv_prepare_init(uv_loop_t *, uv_prepare_t *prepare);

int uv_prepare_start(uv_prepare_t *prepare, uv_prepare_cb cb);

int uv_prepare_stop(uv_prepare_t *prepare);

int uv_check_init(uv_loop_t *, uv_check_t *check);

int uv_check_start(uv_check_t *check, uv_check_cb cb);

int uv_check_stop(uv_check_t *check);

int uv_idle_init(uv_loop_t *, uv_idle_t *idle);

int uv_idle_start(uv_idle_t *idle, uv_idle_cb cb);

int uv_idle_stop(uv_idle_t *idle);

int uv_async_init(uv_loop_t *,
                  uv_async_t *async,
                  uv_async_cb async_cb);

int uv_async_send(uv_async_t *async);

int uv_timer_init(uv_loop_t *, uv_timer_t *handle);

int uv_timer_start(uv_timer_t *handle,
                   uv_timer_cb cb,
                   uint64_t timeout,
                   uint64_t repeat);

int uv_timer_stop(uv_timer_t *handle);

int uv_timer_again(uv_timer_t *handle);

void uv_timer_set_repeat(uv_timer_t *handle, uint64_t repeat);

uint64_t uv_timer_get_repeat(const uv_timer_t *handle);

uint64_t uv_timer_get_due_in(const uv_timer_t *handle);

int uv_getaddrinfo(uv_loop_t *loop,
                   uv_getaddrinfo_t *req,
                   uv_getaddrinfo_cb getaddrinfo_cb,
                   const char *node,
                   const char *service,
                   const struct addrinfo *hints);

int uv_getnameinfo(uv_loop_t *loop,
                   uv_getnameinfo_t *req,
                   uv_getnameinfo_cb getnameinfo_cb,
                   const struct sockaddr *addr,
                   int flags);

int uv_spawn(uv_loop_t *loop,
             uv_process_t *handle,
             const uv_process_options_t *options);

int uv_process_kill(uv_process_t *, int signum);

int uv_kill(int pid, int signum);

uv_pid_t uv_process_get_pid(const uv_process_t *);

int uv_queue_work(uv_loop_t *loop,
                  uv_work_t *req,
                  uv_work_cb work_cb,
                  uv_after_work_cb after_work_cb);

int uv_cancel(uv_req_t *req);

char **uv_setup_args(int argc, char **argv);

int uv_get_process_title(char *buffer, size_t size);

int uv_set_process_title(const char *title);

int uv_resident_set_memory(size_t *rss);

int uv_uptime(double *uptime);

uv_os_fd_t uv_get_osfhandle(int fd);

int uv_open_osfhandle(uv_os_fd_t os_fd);

int uv_getrusage(uv_rusage_t *rusage);

int uv_os_homedir(char *buffer, size_t *size);

int uv_os_tmpdir(char *buffer, size_t *size);

int uv_os_get_passwd(uv_passwd_t *pwd);

void uv_os_free_passwd(uv_passwd_t *pwd);

uv_pid_t uv_os_getpid(void);

uv_pid_t uv_os_getppid(void);

int uv_os_getpriority(uv_pid_t pid, int *priority);

int uv_os_setpriority(uv_pid_t pid, int priority);

unsigned int uv_available_parallelism(void);

int uv_cpu_info(uv_cpu_info_t **cpu_infos, int *count);

void uv_free_cpu_info(uv_cpu_info_t *cpu_infos, int count);

int uv_cpumask_size(void);

int uv_interface_addresses(uv_interface_address_t **addresses,
                           int *count);

void uv_free_interface_addresses(uv_interface_address_t *addresses,
                                 int count);

int uv_os_environ(uv_env_item_t **envitems, int *count);

void uv_os_free_environ(uv_env_item_t *envitems, int count);

int uv_os_getenv(const char *name, char *buffer, size_t *size);

int uv_os_setenv(const char *name, const char *value);

int uv_os_unsetenv(const char *name);

int uv_os_gethostname(char *buffer, size_t *size);

int uv_os_uname(uv_utsname_t *buffer);

int uv_metrics_info(uv_loop_t *loop, uv_metrics_t *metrics);

uint64_t uv_metrics_idle_time(uv_loop_t *loop);

uv_fs_type uv_fs_get_type(const uv_fs_t *);

ssize_t uv_fs_get_result(const uv_fs_t *);

int uv_fs_get_system_error(const uv_fs_t *);

void *uv_fs_get_ptr(const uv_fs_t *);

const char *uv_fs_get_path(const uv_fs_t *);

uv_stat_t *uv_fs_get_statbuf(uv_fs_t *);

void uv_fs_req_cleanup(uv_fs_t *req);

int uv_fs_close(uv_loop_t *loop,
                uv_fs_t *req,
                uv_file file,
                uv_fs_cb cb);

int uv_fs_open(uv_loop_t *loop,
               uv_fs_t *req,
               const char *path,
               int flags,
               int mode,
               uv_fs_cb cb);

int uv_fs_read(uv_loop_t *loop,
               uv_fs_t *req,
               uv_file file,
               const uv_buf_t bufs[],
               unsigned int nbufs,
               int64_t offset,
               uv_fs_cb cb);

int uv_fs_unlink(uv_loop_t *loop,
                 uv_fs_t *req,
                 const char *path,
                 uv_fs_cb cb);

int uv_fs_write(uv_loop_t *loop,
                uv_fs_t *req,
                uv_file file,
                const uv_buf_t bufs[],
                unsigned int nbufs,
                int64_t offset,
                uv_fs_cb cb);

int uv_fs_copyfile(uv_loop_t *loop,
                   uv_fs_t *req,
                   const char *path,
                   const char *new_path,
                   int flags,
                   uv_fs_cb cb);

int uv_fs_mkdir(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                int mode,
                uv_fs_cb cb);

int uv_fs_mkdtemp(uv_loop_t *loop,
                  uv_fs_t *req,
                  const char *tpl,
                  uv_fs_cb cb);

int uv_fs_mkstemp(uv_loop_t *loop,
                  uv_fs_t *req,
                  const char *tpl,
                  uv_fs_cb cb);

int uv_fs_rmdir(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                uv_fs_cb cb);

int uv_fs_scandir(uv_loop_t *loop,
                  uv_fs_t *req,
                  const char *path,
                  int flags,
                  uv_fs_cb cb);

int uv_fs_scandir_next(uv_fs_t *req,
                       uv_dirent_t *ent);

int uv_fs_opendir(uv_loop_t *loop,
                  uv_fs_t *req,
                  const char *path,
                  uv_fs_cb cb);

int uv_fs_readdir(uv_loop_t *loop,
                  uv_fs_t *req,
                  uv_dir_t *dir,
                  uv_fs_cb cb);

int uv_fs_closedir(uv_loop_t *loop,
                   uv_fs_t *req,
                   uv_dir_t *dir,
                   uv_fs_cb cb);

int uv_fs_closedir(uv_loop_t *loop,
                   uv_fs_t *req,
                   uv_dir_t *dir,
                   uv_fs_cb cb);

int uv_fs_stat(uv_loop_t *loop,
               uv_fs_t *req,
               const char *path,
               uv_fs_cb cb);

int uv_fs_fstat(uv_loop_t *loop,
                uv_fs_t *req,
                uv_file file,
                uv_fs_cb cb);

int uv_fs_fsync(uv_loop_t *loop,
                uv_fs_t *req,
                uv_file file,
                uv_fs_cb cb);

int uv_fs_fdatasync(uv_loop_t *loop,
                    uv_fs_t *req,
                    uv_file file,
                    uv_fs_cb cb);

int uv_fs_ftruncate(uv_loop_t *loop,
                    uv_fs_t *req,
                    uv_file file,
                    int64_t offset,
                    uv_fs_cb cb);

int uv_fs_sendfile(uv_loop_t *loop,
                   uv_fs_t *req,
                   uv_file out_fd,
                   uv_file in_fd,
                   int64_t in_offset,
                   size_t length,
                   uv_fs_cb cb);

int uv_fs_access(uv_loop_t *loop,
                 uv_fs_t *req,
                 const char *path,
                 int mode,
                 uv_fs_cb cb);

int uv_fs_chmod(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                int mode,
                uv_fs_cb cb);

int uv_fs_utime(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                double atime,
                double mtime,
                uv_fs_cb cb);

int uv_fs_futime(uv_loop_t *loop,
                 uv_fs_t *req,
                 uv_file file,
                 double atime,
                 double mtime,
                 uv_fs_cb cb);

int uv_fs_lutime(uv_loop_t *loop,
                 uv_fs_t *req,
                 const char *path,
                 double atime,
                 double mtime,
                 uv_fs_cb cb);

int uv_fs_lstat(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                uv_fs_cb cb);

int uv_fs_link(uv_loop_t *loop,
               uv_fs_t *req,
               const char *path,
               const char *new_path,
               uv_fs_cb cb);

int uv_fs_symlink(uv_loop_t *loop,
                  uv_fs_t *req,
                  const char *path,
                  const char *new_path,
                  int flags,
                  uv_fs_cb cb);

int uv_fs_readlink(uv_loop_t *loop,
                   uv_fs_t *req,
                   const char *path,
                   uv_fs_cb cb);

int uv_fs_realpath(uv_loop_t *loop,
                   uv_fs_t *req,
                   const char *path,
                   uv_fs_cb cb);

int uv_fs_realpath(uv_loop_t *loop,
                   uv_fs_t *req,
                   const char *path,
                   uv_fs_cb cb);

int uv_fs_fchmod(uv_loop_t *loop,
                 uv_fs_t *req,
                 uv_file file,
                 int mode,
                 uv_fs_cb cb);

int uv_fs_chown(uv_loop_t *loop,
                uv_fs_t *req,
                const char *path,
                uv_uid_t uid,
                uv_gid_t gid,
                uv_fs_cb cb);

int uv_fs_fchown(uv_loop_t *loop,
                 uv_fs_t *req,
                 uv_file file,
                 uv_uid_t uid,
                 uv_gid_t gid,
                 uv_fs_cb cb);

int uv_fs_lchown(uv_loop_t *loop,
                 uv_fs_t *req,
                 const char *path,
                 uv_uid_t uid,
                 uv_gid_t gid,
                 uv_fs_cb cb);

int uv_fs_statfs(uv_loop_t *loop,
                 uv_fs_t *req,
                 const char *path,
                 uv_fs_cb cb);

int uv_fs_poll_init(uv_loop_t *loop, uv_fs_poll_t *handle);

int uv_fs_poll_start(uv_fs_poll_t *handle,
                     uv_fs_poll_cb poll_cb,
                     const char *path,
                     unsigned int interval);

int uv_fs_poll_stop(uv_fs_poll_t *handle);

int uv_fs_poll_getpath(uv_fs_poll_t *handle,
                       char *buffer,
                       size_t *size);

int uv_signal_init(uv_loop_t *loop, uv_signal_t *handle);

int uv_signal_start(uv_signal_t *handle,
                    uv_signal_cb signal_cb,
                    int signum);

int uv_signal_start(uv_signal_t *handle,
                    uv_signal_cb signal_cb,
                    int signum);

int uv_signal_start_oneshot(uv_signal_t *handle,
                            uv_signal_cb signal_cb,
                            int signum);

int uv_signal_stop(uv_signal_t *handle);

void uv_loadavg(double avg[3]);

int uv_fs_event_init(uv_loop_t *loop, uv_fs_event_t *handle);

int uv_fs_event_start(uv_fs_event_t *handle,
                      uv_fs_event_cb cb,
                      const char *path,
                      unsigned int flags);

int uv_fs_event_stop(uv_fs_event_t *handle);

int uv_fs_event_getpath(uv_fs_event_t *handle,
                        char *buffer,
                        size_t *size);

int uv_ip4_addr(const char *ip, int port, struct sockaddr_in *addr);

int uv_ip6_addr(const char *ip, int port, struct sockaddr_in6 *addr);

int uv_ip4_name(const struct sockaddr_in *src, char *dst, size_t size);

int uv_ip6_name(const struct sockaddr_in6 *src, char *dst, size_t size);

int uv_ip_name(const struct sockaddr *src, char *dst, size_t size);

int uv_inet_ntop(int af, const void *src, char *dst, size_t size);

int uv_random(uv_loop_t *loop,
              uv_random_t *req,
              void *buf,
              size_t buflen,
              unsigned flags, /* For future extension; must be 0. */
              uv_random_cb cb);

int uv_if_indextoname(unsigned int ifindex,
                      char *buffer,
                      size_t *size);

int uv_if_indextoiid(unsigned int ifindex,
                     char *buffer,
                     size_t *size);

int uv_exepath(char *buffer, size_t *size);

int uv_cwd(char *buffer, size_t *size);

int uv_chdir(const char *dir);

uint64_t uv_get_free_memory(void);

uint64_t uv_get_total_memory(void);

uint64_t uv_get_constrained_memory(void);

uint64_t uv_get_available_memory(void);

uint64_t uv_hrtime(void);

void uv_sleep(unsigned int msec);

void uv_disable_stdio_inheritance(void);

int uv_dlopen(const char *filename, uv_lib_t *lib);

void uv_dlclose(uv_lib_t *lib);

int uv_dlsym(uv_lib_t *lib, const char *name, void **ptr);

const char *uv_dlerror(const uv_lib_t *lib);

const char *uv_dlerror(const uv_lib_t *lib);

int uv_gettimeofday(uv_timeval64_t *tv);

int uv_thread_getcpu(void);

void *uv_loop_get_data(const uv_loop_t *);

void uv_loop_set_data(uv_loop_t *, void *data);
/* <<<<<<<< function <<<<<<<< */

#endif /* UV_FFI_FUNCTION_H */