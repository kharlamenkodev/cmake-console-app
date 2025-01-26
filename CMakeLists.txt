cmake_minimum_required(VERSION 3.1...3.14)

set(CMAKE_CONSOLE_APP_PROJECT_NAME "cmake-console-app")

project(${CMAKE_CONSOLE_APP_PROJECT_NAME} VERSION 0.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

add_subdirectory(src)

if (BUILD_CMAKE_CONSOLE_APP_TESTS)
    enable_testing()
    add_subdirectory(tests)
endif()
