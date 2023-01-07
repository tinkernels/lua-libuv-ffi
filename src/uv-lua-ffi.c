#include <stdlib.h>
#include "uv/uv-lua-ffi.h"

int uv_mutex_init_lua(void *handle) {
    return uv_mutex_init((uv_mutex_t *) handle);
}

int uv_mutex_init_recursive_lua(void *handle) {
    return uv_mutex_init_recursive((uv_mutex_t *) handle); /* (uv_mutex_t*) */
}

void uv_mutex_destroy_lua(void *handle) {
    uv_mutex_init_recursive((uv_mutex_t *) handle);
}

void uv_mutex_lock_lua(void *handle) {
    uv_mutex_lock((uv_mutex_t *) handle);
}

int uv_mutex_trylock_lua(void *handle) {
    return uv_mutex_trylock((uv_mutex_t *) handle);
}

void uv_mutex_unlock_lua(void *handle) {
    uv_mutex_unlock((uv_mutex_t *) handle);
}

int uv_rwlock_init_lua(void *rwlock) {
    return uv_rwlock_init((uv_rwlock_t *) rwlock); /* (uv_rwlock_t*) */
}

void uv_rwlock_destroy_lua(void *rwlock) {
    uv_rwlock_destroy((uv_rwlock_t *) rwlock);
}

void uv_rwlock_rdlock_lua(void *rwlock) {
    uv_rwlock_rdlock((uv_rwlock_t *) rwlock);
}

int uv_rwlock_tryrdlock_lua(void *rwlock) {
    return uv_rwlock_tryrdlock((uv_rwlock_t *) rwlock);
}

void uv_rwlock_rdunlock_lua(void *rwlock) {
    uv_rwlock_rdunlock((uv_rwlock_t *) rwlock);
}

void uv_rwlock_wrlock_lua(void *rwlock) {
    uv_rwlock_wrlock((uv_rwlock_t *) rwlock);
}

int uv_rwlock_trywrlock_lua(void *rwlock) {
    return uv_rwlock_trywrlock((uv_rwlock_t *) rwlock);
}

void uv_rwlock_wrunlock_lua(void *rwlock) {
    uv_rwlock_wrunlock((uv_rwlock_t *) rwlock);
}

int uv_sem_init_lua(void *sem, unsigned int value) {
    return uv_sem_init((uv_sem_t *) sem, value); /* (uv_sem_t*) */
}

void uv_sem_destroy_lua(void *sem) {
    uv_sem_destroy((uv_sem_t *) sem);
}

void uv_sem_post_lua(void *sem) {
    uv_sem_post((uv_sem_t *) sem);
}

void uv_sem_wait_lua(void *sem) {
    uv_sem_wait((uv_sem_t *) sem);
}

int uv_sem_trywait_lua(void *sem) {
    return uv_sem_trywait((uv_sem_t *) sem);
}

int uv_cond_init_lua(void *cond) {
    return uv_cond_init((uv_cond_t *) cond); /* (uv_cond_t*) */
}

void uv_cond_destroy_lua(void *cond) {
    uv_cond_destroy((uv_cond_t *) cond);
}

void uv_cond_signal_lua(void *cond) {
    uv_cond_signal((uv_cond_t *) cond);
}

void uv_cond_broadcast_lua(void *cond) {
    uv_cond_broadcast((uv_cond_t *) cond);
}

int uv_barrier_init_lua(void *barrier, unsigned int count) {
    return uv_barrier_init((uv_barrier_t *) barrier, count); /* (uv_barrier_t*) */
}

void uv_barrier_destroy_lua(void *barrier) {
    uv_barrier_destroy((uv_barrier_t *) barrier);
}

int uv_barrier_wait_lua(void *barrier) {
    return uv_barrier_wait((uv_barrier_t *) barrier);
}

void uv_cond_wait_lua(void *cond, void *mutex) {
    uv_cond_wait((uv_cond_t *) cond, (uv_mutex_t *) mutex);
}

int uv_cond_timedwait_lua(void *cond,
                          void *mutex,
                          uint64_t timeout) {
    return uv_cond_timedwait((uv_cond_t *) cond, (uv_mutex_t *) mutex, timeout);
}

void uv_once_lua(void *guard, void (*callback)(void)) {
    uv_once((uv_once_t *) guard, callback);
}

int uv_key_create_lua(void *key) {
    return uv_key_create((uv_key_t *) key);
}

void uv_key_delete_lua(void *key) {
    uv_key_delete((uv_key_t *) key);
}

void *uv_key_get_lua(void *key) {
    return uv_key_get((uv_key_t *) key);
}

void uv_key_set_lua(void *key, void *value) {
    uv_key_set((uv_key_t *) key, value);
}

uv_thread_lua_t *uv_new_thread_lua_t(void) {
    uv_thread_lua_t *lua_th_ = (uv_thread_lua_t *) malloc(sizeof(uv_thread_lua_t));
    uv_thread_t *th_ = (uv_thread_t *) malloc(sizeof(uv_thread_t));
    lua_th_->thread = th_;
    return lua_th_;
}

void uv_free_thread_lua_t(uv_thread_lua_t *th) {
    free(th->thread);
    free(th);
}

int uv_thread_create_lua(uv_thread_lua_t *tid, uv_thread_cb entry, void *arg) {
    return uv_thread_create(tid->thread, entry, arg);
}

int uv_thread_create_ex_lua(uv_thread_lua_t *tid,
                            const uv_thread_options_t *params,
                            uv_thread_cb entry,
                            void *arg) {
    return uv_thread_create_ex(tid->thread,
                               params,
                               entry,
                               arg);
}

int uv_thread_setaffinity_lua(uv_thread_lua_t *tid,
                              char *cpumask,
                              char *oldmask,
                              size_t mask_size) {
    return uv_thread_setaffinity(tid->thread,
                                 cpumask,
                                 oldmask,
                                 mask_size);
}

int uv_thread_getaffinity_lua(uv_thread_lua_t *tid,
                              char *cpumask,
                              size_t mask_size) {
    return uv_thread_getaffinity(tid->thread,
                                 cpumask,
                                 mask_size);
}

uv_thread_lua_t *uv_thread_self_lua(void) {
    uv_thread_lua_t *ret_ = (uv_thread_lua_t *) malloc(sizeof(uv_thread_lua_t));;
    *ret_->thread = uv_thread_self();
    return ret_;
}

int uv_thread_join_lua(uv_thread_lua_t *tid) {
    return uv_thread_join(tid->thread);
}

int uv_thread_equal_lua(const uv_thread_lua_t *t1, const uv_thread_lua_t *t2) {
    return uv_thread_equal(t1->thread, t2->thread);
}

void uv_print_all_handles_lua(uv_loop_t *loop, void *stream) {
    uv_print_all_handles(loop, (FILE *) stream);
}

void uv_print_active_handles_lua(uv_loop_t *loop, void *stream) {
    uv_print_active_handles(loop, (FILE *) stream);
}
