#ifndef UV_FFI_TYPE_WIN_PRE_H
#define UV_FFI_TYPE_WIN_PRE_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct uv_buf_t {
    char *base;
    size_t len;
} uv_buf_t;

typedef unsigned int uv_uid_t;
typedef unsigned int uv_gid_t;

#endif /* UV_FFI_TYPE_WIN_PRE_H */