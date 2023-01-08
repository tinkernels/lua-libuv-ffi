#ifndef UV_LUA_FFI_H
#define UV_LUA_FFI_H

#include "uv.h"

UV_EXTERN int uv_mutex_init_lua(void *handle);

UV_EXTERN int uv_mutex_init_recursive_lua(void *handle);

UV_EXTERN void uv_mutex_destroy_lua(void *handle);

UV_EXTERN void uv_mutex_lock_lua(void *handle);

UV_EXTERN int uv_mutex_trylock_lua(void *handle);

UV_EXTERN void uv_mutex_unlock_lua(void *handle);

UV_EXTERN int uv_rwlock_init_lua(void *rwlock);

UV_EXTERN void uv_rwlock_destroy_lua(void *rwlock);

UV_EXTERN void uv_rwlock_rdlock_lua(void *rwlock);

UV_EXTERN int uv_rwlock_tryrdlock_lua(void *rwlock);

UV_EXTERN void uv_rwlock_rdunlock_lua(void *rwlock);

UV_EXTERN void uv_rwlock_wrlock_lua(void *rwlock);

UV_EXTERN int uv_rwlock_trywrlock_lua(void *rwlock);

UV_EXTERN void uv_rwlock_wrunlock_lua(void *rwlock);

UV_EXTERN int uv_sem_init_lua(void *sem, unsigned int value);

UV_EXTERN void uv_sem_destroy_lua(void *sem);

UV_EXTERN void uv_sem_post_lua(void *sem);

UV_EXTERN void uv_sem_wait_lua(void *sem);

UV_EXTERN int uv_sem_trywait_lua(void *sem);

UV_EXTERN int uv_cond_init_lua(void *cond);

UV_EXTERN void uv_cond_destroy_lua(void *cond);

UV_EXTERN void uv_cond_signal_lua(void *cond);

UV_EXTERN void uv_cond_broadcast_lua(void *cond);

UV_EXTERN int uv_barrier_init_lua(void *barrier, unsigned int count);

UV_EXTERN void uv_barrier_destroy_lua(void *barrier);

UV_EXTERN int uv_barrier_wait_lua(void *barrier);

UV_EXTERN void uv_cond_wait_lua(void *cond, void *mutex);

UV_EXTERN int uv_cond_timedwait_lua(void *cond,
                                    void *mutex,
                                    uint64_t timeout);

UV_EXTERN void uv_once_lua(void *guard, void (*callback)(void));

UV_EXTERN int uv_key_create_lua(void *key);

UV_EXTERN void uv_key_delete_lua(void *key);

UV_EXTERN void *uv_key_get_lua(void *key);

UV_EXTERN void uv_key_set_lua(void *key, void *value);

UV_EXTERN void uv_print_all_handles_lua(uv_loop_t *loop, void *stream);

UV_EXTERN void uv_print_active_handles_lua(uv_loop_t *loop, void *stream);

#endif /* UV_LUA_FFI_H */
