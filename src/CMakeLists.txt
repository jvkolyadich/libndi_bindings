# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(libndi_bindings_library VERSION 0.0.1 LANGUAGES C)

add_library(libndi_bindings SHARED
  "libndi_bindings.c"
)

set_target_properties(libndi_bindings PROPERTIES
  PUBLIC_HEADER libndi_bindings.h
  OUTPUT_NAME "libndi_bindings"
)

target_compile_definitions(libndi_bindings PUBLIC DART_SHARED_LIB)
