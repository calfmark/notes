cmake_minimum_required(VERSION 3.23)
project(benchmark_example)

set(CMAKE_CXX_STANDARD 14)

add_executable(benchmark_example main.cpp)

target_link_libraries(benchmark_example benchmark pthread)
