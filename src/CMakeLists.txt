set(CMAKE_CONSOLE_APP_TARGET_NAME "cmake-console-app")

include(third_party)
include(compiler_warnings)

file(GLOB_RECURSE CMAKE_CONSOLE_APP_SOURCES "./*.cpp")

add_executable(${CMAKE_CONSOLE_APP_TARGET_NAME} ${CMAKE_CONSOLE_APP_SOURCES})

target_include_directories(${CMAKE_CONSOLE_APP_TARGET_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include)

target_link_libraries(
    ${CMAKE_CONSOLE_APP_TARGET_NAME}
    # todo - link logger
)

target_link_third_party(${CMAKE_CONSOLE_APP_TARGET_NAME})
enable_target_compiler_warnings(${CMAKE_CONSOLE_APP_TARGET_NAME} PUBLIC)