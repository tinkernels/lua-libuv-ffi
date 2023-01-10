message(STATUS "Post install actions for lua-libuv-ffi")
foreach(INS_FILE ${CMAKE_INSTALL_MANIFEST_FILES})
    # remove all installed files after install
    message(STATUS "Removing: ${INS_FILE}")
    file(REMOVE ${INS_FILE})
endforeach()
