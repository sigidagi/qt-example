set(CMAKE_SYSTEM_VERSION 1)
#set(CMAKE_SYSTEM_NAME "iOS")
set(CMAKE_OSX_SYSROOT "iphonesimulator")
set(CMAKE_OSX_ARCHITECTURES "x86_64")
set(CMAKE_SYSTEM_PROCESSOR "x86_64")

set(CMAKE_C_COMPILER x86_64h-apple-darwin20.4-clang)
set(CMAKE_CXX_COMPILER x86_64h-apple-darwin20.4-clang++)
set(CMAKE_AR x86_64h-apple-darwin20.4-ar)
set(CMAKE_RANLIB x86_64h-apple-darwin20.4-ranlib)

message(STATUS "macos compiler ${CMAKE_CXX_COMPILER}, ios: '${IOS}'")
