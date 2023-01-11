#ifndef UV_FFI_TYPE_H
#define UV_FFI_TYPE_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "uv-ffi-type-unix.h"
#include "uv-ffi-type-win.h"

/* >>>>>>>> typedef universe >>>>>>>> */

typedef void *(*uv_malloc_func)(size_t size);

typedef void *(*uv_realloc_func)(void *ptr, size_t size);

typedef void *(*uv_calloc_func)(size_t count, size_t size);

typedef void (*uv_free_func)(void *ptr);

typedef struct uv_loop_s uv_loop_t;
typedef enum {
    UV_LOOP_BLOCK_SIGNAL = 0,
    UV_METRICS_IDLE_TIME
} uv_loop_option;

typedef enum {
    UV_RUN_DEFAULT = 0,
    UV_RUN_ONCE,
    UV_RUN_NOWAIT
} uv_run_mode;

typedef struct uv_handle_s uv_handle_t;
typedef struct uv_prepare_s uv_prepare_t;
typedef struct uv_shutdown_s uv_shutdown_t;
typedef struct uv_stream_s uv_stream_t;

typedef void (*uv_prepare_cb)(uv_prepare_t *handle);

typedef void (*uv_shutdown_cb)(uv_shutdown_t *req, int status);

typedef enum {
    UV_UNKNOWN_HANDLE = 0,
    UV_ASYNC,
    UV_CHECK,
    UV_FS_EVENT,
    UV_FS_POLL,
    UV_HANDLE,
    UV_IDLE,
    UV_NAMED_PIPE,
    UV_POLL,
    UV_PREPARE,
    UV_PROCESS,
    UV_STREAM,
    UV_TCP,
    UV_TIMER,
    UV_TTY,
    UV_UDP,
    UV_SIGNAL,
    UV_FILE,
    UV_HANDLE_TYPE_MAX
} uv_handle_type;

typedef struct uv_req_s uv_req_t;

typedef void (*uv_walk_cb)(uv_handle_t *handle, void *arg);

/* FIX: type FILE */

typedef void (*uv_close_cb)(uv_handle_t *handle);

typedef void (*uv_connection_cb)(uv_stream_t *server, int status);

typedef void (*uv_alloc_cb)(uv_handle_t *handle,
                            size_t suggested_size,
                            uv_buf_t *buf);

typedef void (*uv_read_cb)(uv_stream_t *stream,
                           ssize_t nread,
                           const uv_buf_t *buf);

typedef struct uv_write_s uv_write_t;

typedef void (*uv_write_cb)(uv_write_t *req, int status);

typedef struct uv_tcp_s uv_tcp_t;
struct sockaddr;
typedef struct uv_connect_s uv_connect_t;

typedef void (*uv_connect_cb)(uv_connect_t *req, int status);

typedef struct uv_udp_s uv_udp_t;
typedef enum {
    UV_LEAVE_GROUP = 0,
    UV_JOIN_GROUP
} uv_membership;

typedef struct uv_udp_send_s uv_udp_send_t;

typedef void (*uv_udp_send_cb)(uv_udp_send_t *req, int status);

typedef void (*uv_udp_recv_cb)(uv_udp_t *handle,
                               ssize_t nread,
                               const uv_buf_t *buf,
                               const struct sockaddr *addr,
                               unsigned flags);

typedef struct uv_tty_s uv_tty_t;
typedef enum {
    UV_TTY_MODE_NORMAL,
    UV_TTY_MODE_RAW,
    UV_TTY_MODE_IO
} uv_tty_mode_t;

typedef enum {
    UV_TTY_SUPPORTED,
    UV_TTY_UNSUPPORTED
} uv_tty_vtermstate_t;

typedef struct uv_pipe_s uv_pipe_t;
typedef struct uv_poll_s uv_poll_t;

typedef void (*uv_poll_cb)(uv_poll_t *handle, int status, int events);

typedef struct uv_check_s uv_check_t;

typedef void (*uv_check_cb)(uv_check_t *handle);

typedef struct uv_idle_s uv_idle_t;

typedef void (*uv_idle_cb)(uv_idle_t *handle);

typedef struct uv_async_s uv_async_t;

typedef void (*uv_async_cb)(uv_async_t *handle);

typedef struct uv_timer_s uv_timer_t;

typedef void (*uv_timer_cb)(uv_timer_t *handle);

typedef struct uv_getaddrinfo_s uv_getaddrinfo_t;
struct addrinfo;

typedef void (*uv_getaddrinfo_cb)(uv_getaddrinfo_t *req,
                                  int status,
                                  struct addrinfo *res);

typedef struct uv_getnameinfo_s uv_getnameinfo_t;

typedef void (*uv_getnameinfo_cb)(uv_getnameinfo_t *req,
                                  int status,
                                  const char *hostname,
                                  const char *service);

typedef struct uv_process_s uv_process_t;

typedef void (*uv_exit_cb)(uv_process_t *, int64_t exit_status, int term_signal);

typedef enum {
    UV_IGNORE = 0x00,
    UV_CREATE_PIPE = 0x01,
    UV_INHERIT_FD = 0x02,
    UV_INHERIT_STREAM = 0x04,
    UV_READABLE_PIPE = 0x10,
    UV_WRITABLE_PIPE = 0x20,
    UV_NONBLOCK_PIPE = 0x40,
    UV_OVERLAPPED_PIPE = 0x40
} uv_stdio_flags;

typedef struct uv_stdio_container_s {
    uv_stdio_flags flags;

    union {
        uv_stream_t *stream;
        int fd;
    } data;
} uv_stdio_container_t;

enum uv_process_flags {
  UV_PROCESS_SETUID = (1 << 0),
  UV_PROCESS_SETGID = (1 << 1),
  UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = (1 << 2),
  UV_PROCESS_DETACHED = (1 << 3),
  UV_PROCESS_WINDOWS_HIDE = (1 << 4),
  UV_PROCESS_WINDOWS_HIDE_CONSOLE = (1 << 5),
  UV_PROCESS_WINDOWS_HIDE_GUI = (1 << 6)
};

typedef struct uv_process_options_s {
    uv_exit_cb exit_cb;
    const char *file;
    char **args;
    char **env;
    const char *cwd;
    unsigned int flags;
    int stdio_count;
    uv_stdio_container_t *stdio;
    uv_uid_t uid;
    uv_gid_t gid;
} uv_process_options_t;

typedef struct uv_work_s uv_work_t;

typedef void (*uv_work_cb)(uv_work_t *req);

typedef void (*uv_after_work_cb)(uv_work_t *req, int status);

typedef struct {
    long tv_sec;
    long tv_usec;
} uv_timeval_t;

typedef struct {
    uv_timeval_t ru_utime; /* user CPU time used */
    uv_timeval_t ru_stime; /* system CPU time used */
    uint64_t ru_maxrss;    /* maximum resident set size */
    uint64_t ru_ixrss;     /* integral shared memory size */
    uint64_t ru_idrss;     /* integral unshared data size */
    uint64_t ru_isrss;     /* integral unshared stack size */
    uint64_t ru_minflt;    /* page reclaims (soft page faults) */
    uint64_t ru_majflt;    /* page faults (hard page faults) */
    uint64_t ru_nswap;     /* swaps */
    uint64_t ru_inblock;   /* block input operations */
    uint64_t ru_oublock;   /* block output operations */
    uint64_t ru_msgsnd;    /* IPC messages sent */
    uint64_t ru_msgrcv;    /* IPC messages received */
    uint64_t ru_nsignals;  /* signals received */
    uint64_t ru_nvcsw;     /* voluntary context switches */
    uint64_t ru_nivcsw;    /* involuntary context switches */
} uv_rusage_t;

typedef struct uv_passwd_s uv_passwd_t;
typedef struct uv_cpu_info_s uv_cpu_info_t;
typedef struct uv_interface_address_s uv_interface_address_t;
typedef struct uv_env_item_s uv_env_item_t;
typedef struct uv_utsname_s uv_utsname_t;
typedef struct uv_metrics_s uv_metrics_t;
typedef enum {
    UV_FS_UNKNOWN = -1,
    UV_FS_CUSTOM,
    UV_FS_OPEN,
    UV_FS_CLOSE,
    UV_FS_READ,
    UV_FS_WRITE,
    UV_FS_SENDFILE,
    UV_FS_STAT,
    UV_FS_LSTAT,
    UV_FS_FSTAT,
    UV_FS_FTRUNCATE,
    UV_FS_UTIME,
    UV_FS_FUTIME,
    UV_FS_ACCESS,
    UV_FS_CHMOD,
    UV_FS_FCHMOD,
    UV_FS_FSYNC,
    UV_FS_FDATASYNC,
    UV_FS_UNLINK,
    UV_FS_RMDIR,
    UV_FS_MKDIR,
    UV_FS_MKDTEMP,
    UV_FS_RENAME,
    UV_FS_SCANDIR,
    UV_FS_LINK,
    UV_FS_SYMLINK,
    UV_FS_READLINK,
    UV_FS_CHOWN,
    UV_FS_FCHOWN,
    UV_FS_REALPATH,
    UV_FS_COPYFILE,
    UV_FS_LCHOWN,
    UV_FS_OPENDIR,
    UV_FS_READDIR,
    UV_FS_CLOSEDIR,
    UV_FS_STATFS,
    UV_FS_MKSTEMP,
    UV_FS_LUTIME
} uv_fs_type;

typedef int uv_file;
typedef struct uv_fs_s uv_fs_t;
typedef struct {
    long tv_sec;
    long tv_nsec;
} uv_timespec_t;

typedef struct {
    uint64_t st_dev;
    uint64_t st_mode;
    uint64_t st_nlink;
    uint64_t st_uid;
    uint64_t st_gid;
    uint64_t st_rdev;
    uint64_t st_ino;
    uint64_t st_size;
    uint64_t st_blksize;
    uint64_t st_blocks;
    uint64_t st_flags;
    uint64_t st_gen;
    uv_timespec_t st_atim;
    uv_timespec_t st_mtim;
    uv_timespec_t st_ctim;
    uv_timespec_t st_birthtim;
} uv_stat_t;

typedef void (*uv_fs_cb)(uv_fs_t *req);

typedef struct uv_dirent_s uv_dirent_t;
typedef struct uv_dir_s uv_dir_t;
typedef struct uv_fs_poll_s uv_fs_poll_t;

typedef void (*uv_fs_poll_cb)(uv_fs_poll_t *handle,
                              int status,
                              const uv_stat_t *prev,
                              const uv_stat_t *curr);

typedef struct uv_signal_s uv_signal_t;

typedef void (*uv_signal_cb)(uv_signal_t *handle, int signum);

typedef struct uv_fs_event_s uv_fs_event_t;

typedef void (*uv_fs_event_cb)(uv_fs_event_t *handle,
                               const char *filename,
                               int events,
                               int status);

typedef struct uv_random_s uv_random_t;

typedef void (*uv_random_cb)(uv_random_t *req,
                             int status,
                             void *buf,
                             size_t buflen);

typedef struct {
    void *handle;
    char *errmsg;
} uv_lib_t;

struct sockaddr_in;
struct sockaddr_in6;

typedef struct {
    int64_t tv_sec;
    int32_t tv_usec;
} uv_timeval64_t;

/* <<<<<<<< typedef universe *2* <<<<<<<< */

#endif /* UV_FFI_TYPE_H */