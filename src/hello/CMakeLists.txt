project(hello)

# Tell CMake to create the helloworld executable
add_executable(${PROJECT_NAME}
    hello.cpp
    )

#target_link_libraries(${PROJECT_NAME} Qt${QT_VERSION_MAJOR}::Widgets)
