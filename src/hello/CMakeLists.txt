project(glutdemo)

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
#set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
## search headers and libraries in the target environment
#set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
#set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

message(STATUS "SDK path: ${CMAKE_OSX_SYSROOT}")

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules" ${CMAKE_MODULE_PATH})

#find_package(GL REQUIRED HINTS /usr/lib/x86_64-linux-gnu)

if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    add_definitions(-Wno-deprecated-declarations)
endif()

find_package(GLUT REQUIRED)
#find_package(GL REQUIRED)

#if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    #message(STATUS "Compiling for MacOS target")
    
    #find_package(MacGL REQUIRED)    
    #set(CMAKE_CXX_FLAGS "--sysroot ${CMAKE_OSX_SYSROOT} ${CMAKE_CXX_FLAGS}")
    
    ##link_directories(
        ##/System/Library/Frameworks/GLUT.framework
        ##/System/Library/Frameworks/GLUT.framework/Headers
        ##)
#else()
    #message(STATUS "Compiling for Linux target")
    #link_directories(/usr/lib/x86_64-linux-gnu)
#endif()

include_directories(
    ${OPENGL_INCLUDE_DIR}
    ${GLUT_INCLUDE_DIR}
    )

# Tell CMake to create the helloworld executable
add_executable(${PROJECT_NAME}
    main.cpp
    )


if(CMAKE_SYSTEM_NAME MATCHES "Linux")
    target_link_libraries(${PROJECT_NAME} 
        ${GLUT_LIBRARIES}
        ${OPENGL_LIBRARIES}
        /usr/lib/x86_64-linux-gnu/libGL.so
     )
else()
    target_link_libraries(${PROJECT_NAME} 
        ${GLUT_LIBRARIES}
        ${OPENGL_LIBRARIES}
     )
endif()

