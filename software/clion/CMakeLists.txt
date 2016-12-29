# Ubuntu 16.04LTS
# Clion 2016
# sudo apt-get install libgtk-3-dev

cmake_minimum_required(VERSION 3.6)
project(testGlib)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES main.c)
add_executable(testGlib ${SOURCE_FILES})

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)
pkg_check_modules(GLIB REQUIRED glib-2.0)

include_directories(${GLIB_INCLUDE_DIRS})
include_directories(${GTK3_INCLUDE_DIRS})

link_directories(${GTK3_LIBRARY_DIRS})

add_definitions(${GTK3_CFLAGS_OTHER})

target_link_libraries(${PROJECT_NAME} ${GLIB_LIBRARIES} ${GTK3_LIBRARIES})


##include <glib-2.0/glib.h>
#
#int main (void)
#{
#g_print ("Hello World!");
#
#return 0;
#}
