cmake_minimum_required(VERSION 3.8.2)

project(helloworld)
project(${PROJECT_NAME} VERSION 0.1.1)

set(PROJECT_VERSION_TWEAK "beta-sd")
message(STATUS "Project version ${PROJECT_VERSION}")


# Find includes in the build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Turn on automatic invocation of the MOC, UIC & RCC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

# Add a compiler flag
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
message(STATUS "System name: ${CMAKE_SYSTEM_NAME}")

# Find the QtWidgets library
find_package(Qt5 REQUIRED COMPONENTS Widgets)

if(IOS) 
    set(CMAKE_XCODE_ATTRIBUTE_FRAMEWORK_SEARCH_PATHS "${CMAKE_FIND_ROOT_PATH}/lib")
    set(IOS_INCLUDE_PATH ${CMAKE_FIND_ROOT_PATH}/lib)
    include_directories(${IOS_INCLUDE_PATH})
    message(STATUS  "mac include dirs: ${IOS_INCLUDE_PATH}")
endif()


# Tell CMake to create the helloworld executable
add_executable(${PROJECT_NAME}
    src/main.cpp
    src/mainwindow.cpp
    src/mainwindow.ui 
    resources.qrc
    )

# Add the Qt5 Widgets for linking
target_link_libraries(${PROJECT_NAME} Qt5::Widgets)
if(IOS) 
    #target_link_options(helloworld PRIVATE "-Wl,-e,_qt_main_wrapper")
    set_target_properties(${PROJECT_NAME} PROPERTIES LINK_FLAGS "-Wl,-F/System/Library/Frameworks")
endif()
