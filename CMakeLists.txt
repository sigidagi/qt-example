cmake_minimum_required(VERSION 3.8.2)

project(helloworld)
project(${PROJECT_NAME} VERSION 0.1.1)

set(PROJECT_VERSION_TWEAK "beta-sd")
message(STATUS "Project version ${PROJECT_VERSION}")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
# Find includes in the build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)


# Add a compiler flag
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
message(STATUS "System name: ${CMAKE_SYSTEM_NAME}")

if(QT_USE) 
    add_subdirectory(src/qtdemo)
else()
    add_subdirectory(src/hello)
endif()


