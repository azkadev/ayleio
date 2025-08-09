# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "ayleio_flutter")

set(CMAKE_CXX_STANDARD 17)

project(${PROJECT_NAME} LANGUAGES CXX)



# ------------------------------------------------------------------------------
set(MIMALLOC "mimalloc-2.1.2.tar.gz")


set(MIMALLOC_ARCHIVE "${CMAKE_CURRENT_SOURCE_DIR}/mimalloc-2.1.2.tar.gz")
set(MIMALLOC_SRC "${CMAKE_BINARY_DIR}/mimalloc")



function(check_directory_exists_and_not_empty dir result_var)
  # Check if the directory exists
  if(EXISTS "${dir}")
    # Check if the directory is not empty
    file(GLOB dir_contents "${dir}/*")

    if(dir_contents)
      set(${result_var} TRUE PARENT_SCOPE)
    else()
      set(${result_var} FALSE PARENT_SCOPE)
      message(STATUS "Directory ${dir} exists but is empty!")
    endif()
  else()
    set(${result_var} FALSE PARENT_SCOPE)
    message(STATUS "Directory ${dir} does not exist!")
  endif()
endfunction()

# Extract
# https://stackoverflow.com/a/19859882/12825435
set(MIMALLOC_LIB "${MIMALLOC_SRC}/out/release/mimalloc.o" CACHE INTERNAL "")

check_directory_exists_and_not_empty(${MIMALLOC_SRC} MIMALLOC_VALID)

if(NOT MIMALLOC_VALID)
  message(STATUS "Extracting ${MIMALLOC}...")
  make_directory("${MIMALLOC_SRC}")
  add_custom_command(
    OUTPUT ${MIMALLOC_LIB}
    COMMAND "${CMAKE_COMMAND}" -E tar xzf "\"${MIMALLOC_ARCHIVE}\""

    # add_subdirectory() is too much work. Alternatively building it through command line.
    COMMAND "mkdir" "-p" "out/release"
    COMMAND "cd" "out/release"
    COMMAND "${CMAKE_COMMAND}" "../../mimalloc-2.1.2"
    COMMAND "make"
    WORKING_DIRECTORY "${MIMALLOC_SRC}"
  )
endif()

add_custom_target("MIMALLOC_TARGET" ALL DEPENDS ${MIMALLOC_LIB})

# ------------------------------------------------------------------------------
set(PLUGIN_NAME "ayleio_flutter_plugin")

add_library(
  ${PLUGIN_NAME} SHARED
  "ayleio_flutter.cc"
  "texture_gl.cc"
  "texture_sw.cc"
  "video_output_manager.cc"
  "video_output.cc"
  "utils.cc"
)

apply_standard_settings(${PLUGIN_NAME})

# Check for libmpv & epoxy headers & libraries.
find_package(PkgConfig REQUIRED)
pkg_check_modules(mpv IMPORTED_TARGET mpv)
pkg_check_modules(epoxy IMPORTED_TARGET epoxy)

set_target_properties(
  ${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden
  OUTPUT_NAME "ayleio_flutter"
)

target_compile_definitions(
  ${PLUGIN_NAME} PRIVATE
  FLUTTER_PLUGIN_IMPL
)

target_compile_options(${PLUGIN_NAME} PRIVATE "${mpv_CFLAGS_OTHER}")
target_compile_options(${PLUGIN_NAME} PRIVATE "${epoxy_CFLAGS_OTHER}")

target_include_directories(
  ${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include"
  "${mpv_INCLUDE_DIRS}"
  "${epoxy_INCLUDE_DIRS}"
)

target_link_libraries(
  ${PLUGIN_NAME} PRIVATE
  flutter
  PkgConfig::GTK
  PkgConfig::mpv
  PkgConfig::epoxy
)

# add_subdirectory(
#   "${CMAKE_CURRENT_SOURCE_DIR}/../native/media_universe_native_event_loop"
#   "${CMAKE_CURRENT_BINARY_DIR}/media_universe_native_event_loop"
# )

set(
  ayleio_flutter_bundled_libraries
  $<TARGET_FILE:ayleio_flutter_plugin>
  # $<TARGET_FILE:media_kit_native_event_loop_fork>
  PARENT_SCOPE
)


