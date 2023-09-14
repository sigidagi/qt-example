project(qtdemo)

# Turn on automatic invocation of the MOC, UIC & RCC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Find the QtWidgets library
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Widgets OpenGL)

get_property(locWidgets TARGET Qt5::Widgets PROPERTY IMPORTED_LOCATION_RELEASE)
get_property(locCore TARGET Qt5::Core PROPERTY IMPORTED_LOCATION_RELEASE)
get_property(locOpenGL TARGET Qt5::OpenGL PROPERTY IMPORTED_LOCATION_RELEASE)
message(STATUS "QtWidgets library path: ${locWidgets}")
message(STATUS "QtCore library path: ${locCore}")
message(STATUS "QtOpenGL library path: ${locOpenGL}")

# Tell CMake to create the helloworld executable
add_executable(${PROJECT_NAME}
    main.cpp
    mainwindow.cpp
    mainwindow.ui 
    resources.qrc
    )

# Add the Qt5 Widgets for linking
# target_link_libraries(${PROJECT_NAME} Qt5::Widgets)
target_link_libraries(${PROJECT_NAME} Qt${QT_VERSION_MAJOR}::Widgets)

## ---------------------------- END ----------------------------

## ---------- old STUFF ---------------

#if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    #set(CMAKE_XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "${CMAKE_FIND_ROOT_PATH}/lib")
    #set(IOS_INCLUDE_PATH ${CMAKE_FIND_ROOT_PATH}/lib)
    #include_directories(${IOS_INCLUDE_PATH})
    #message(STATUS  "mac include dirs: ${IOS_INCLUDE_PATH}")
#endif()


#if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    #set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-Wl,-F/System/Library/Frameworks")
#endif()

#set(CPU_ARCH "aarch64" CACHE STRING "cpu architecture")
#set(MACHINE "linux" CACHE STRING "system machine name")
#set(CLIB "gnu" CACHE STRING "c library")

#if(CMAKE_SYSTEM_NAME MATCHES "Darwin")
    #message("Zig toolchain for Darwin (MacOS) target")
    ## adjust the default behavior of the FIND_XXX() commands:
    ## search programs in the host environment
    #set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    ## search headers and libraries in the target environment
    #set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    #set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
#endif()



