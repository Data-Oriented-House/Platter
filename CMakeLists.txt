cmake_minimum_required(VERSION 3.0.0)

project(
    Platter
    HOMEPAGE_URL https://github.com/Data-Oriented-House/Platter
    LANGUAGES CXX
)

add_executable(main "src/main.cpp")

target_compile_options(main PUBLIC)
