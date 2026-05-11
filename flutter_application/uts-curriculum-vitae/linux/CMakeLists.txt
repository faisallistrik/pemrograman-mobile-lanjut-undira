cmake_minimum_required(VERSION 3.14)
project(uts_curriculum_vitae LANGUAGES CXX)

set(BINARY_NAME "uts_curriculum_vitae")
set(BINARY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/build/linux/x64/release/bundle")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(${BINARY_NAME}
  linux/my_application.cc
)

target_compile_definitions(${BINARY_NAME} PRIVATE
  APPLICATION_ID=\"com.example.uts_curriculum_vitae\"
)

target_compile_options(${BINARY_NAME} PRIVATE -Wall -Wextra)
