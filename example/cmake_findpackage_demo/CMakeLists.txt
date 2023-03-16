cmake_minimum_required(VERSION 2.8.12)
project(cmake_findpackage_demo)

# 添加Findgmp.cmake所在目录即可
list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/../../)
#   在你的工程中，建议将本仓库放到：<project_dir>/Dependencies/gmp
#   而这里就要改成：list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/Dependencies/gmp)

# 使用find_package module模式，查找Findgmp.cmake文件
find_package(gmp)

# 创建你的可执行文件
add_executable(example main.cpp)
# 添加gmp依赖
target_link_libraries(example PRIVATE gmp)
# 将gmp的DLL拷贝到example的输出目录当中
copy_gmp_dll(example)