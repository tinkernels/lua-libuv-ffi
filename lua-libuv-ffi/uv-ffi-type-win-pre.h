#ifndef UV_FFI_TYPE_WIN_PRE_H
#define UV_FFI_TYPE_WIN_PRE_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef unsigned long ULONG;

typedef struct uv_buf_t {
    ULONG len;
    char* base;
} uv_buf_t;

typedef unsigned char uv_uid_t;
typedef unsigned char uv_gid_t;

#endif /* UV_FFI_TYPE_WIN_PRE_H */