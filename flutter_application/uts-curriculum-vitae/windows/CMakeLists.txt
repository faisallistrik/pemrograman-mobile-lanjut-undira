cmake_minimum_required(VERSION 3.14)
project(uts_curriculum_vitae LANGUAGES CXX)

set(BINARY_NAME "uts_curriculum_vitae")
set(BINARY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build/windows/runner")

set(CMAKE_EXECUTABLE_SUFFIX ".exe")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc")

add_executable(${BINARY_NAME} WIN32
  runner.cpp
)

target_compile_definitions(${BINARY_NAME} PRIVATE
  _CRT_SECURE_NO_WARNINGS
)

target_link_libraries(${BINARY_NAME} PRIVATE
  user32.lib
  kernel32.lib
  shell32.lib
)
