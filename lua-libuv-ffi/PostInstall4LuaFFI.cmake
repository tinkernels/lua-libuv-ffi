if(LUA_FFI_SRC_DIR)
    message(STATUS "Post install actions for lua-libuv-ffi")
    list(APPEND LIBUV_DLL_REGSTRS "\\.dll")
    list(APPEND LIBUV_DLL_REGSTRS "\\.so")
    list(APPEND LIBUV_DLL_REGSTRS "\\.dylib")

    foreach(INS_FILE ${CMAKE_INSTALL_MANIFEST_FILES})
        # copy dynamic library
        get_filename_component(FN_ ${INS_FILE} NAME)

        foreach(REGSTR ${LIBUV_DLL_REGSTRS})
            string(REGEX MATCH ${REGSTR} FOUND ${FN_})

            if(FOUND)
                message(STATUS "COPY: ${FN_} > ${LUA_FFI_SRC_DIR}/lua-libuv-ffi")
                file(COPY ${INS_FILE} DESTINATION ${LUA_FFI_SRC_DIR}/lua-libuv-ffi)
            endif()
        endforeach()

        message(STATUS "Removing: ${INS_FILE}")

        # remove all installed files after install
        file(REMOVE ${INS_FILE})
    endforeach()
endif()
