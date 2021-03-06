cmake_minimum_required (VERSION 2.8)   

project(bsw)

set(CMAKE_CXX_COMPILER "${XILINX_SDX}/bin/xcpp")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O4 -g -DSDX_PLATFORM=xilinx_aws-vu9p-f1-04261818_dynamic_5_0 -D__USE_XOPEN2K8 -I${XILINX_SDX}/runtime/include/1_2/ -I${XILINX_VIVADO}/include/ -fmessage-length=0 -std=c++11")

set (XILINX_LINK_LIBS libxilinxopencl.so)
link_directories(${XILINX_SDX}/runtime/lib/x86_64 ${LD_LIBRARY_PATH})

find_package(ZLIB REQUIRED)
# To find and use zlib
find_path(ZLIB_INCLUDE_DIR zlib.h)
include_directories(${ZLIB_INCLUDE_DIR})

add_executable(bsw
    Chameleon.cpp
    ConfigFile.cpp
    main.cpp)

if(ZLIB_FOUND)
    include_directories(${ZLIB_INCLUDE_DIRS})
    target_link_libraries (bsw PRIVATE rt stdc++ ${XILINX_LINK_LIBS} ${ZLIB_LIBRARIES})
endif()

if(TARGET zlib::zlib)
    target_link_libraries(bsw PRIVATE rt stdc++ ${XILINX_LINK_LIBS} zlib::zlib)
endif()

execute_process (
    COMMAND bash -c "${XILINX_SDX}/bin/emconfigutil --od . --nd 1  --platform ${AWS_PLATFORM}")
