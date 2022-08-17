# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(libndi_ios_library VERSION 0.0.1 LANGUAGES C)

add_library(libndi_ios STATIC libndi_ios.c)

set_target_properties(libndi_ios PROPERTIES
  PUBLIC_HEADER libndi_ios.h
  OUTPUT_NAME "ndi_ios"
  XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "${CODE_SIGN_IDENTITY}"
)
