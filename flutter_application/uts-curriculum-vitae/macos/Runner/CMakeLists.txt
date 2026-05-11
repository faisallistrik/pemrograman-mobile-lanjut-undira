project(Runner LANGUAGES CXX)

cmake_minimum_required(VERSION 3.14)

set(BINARY_NAME "uts_curriculum_vitae")

add_executable(${BINARY_NAME}
  macos/Runner/main.cc
)

target_compile_features(${BINARY_NAME} PRIVATE cxx_std_17)

target_compile_options(${BINARY_NAME} PRIVATE -fvisibility=hidden)

target_link_libraries(${BINARY_NAME} PRIVATE "-framework Cocoa")
