#!/bin/bash

if [[ ${DEBUG_C} == yes ]]; then
  CMAKE_BUILD_TYPE=Debug
else
  CMAKE_BUILD_TYPE=Release
fi

mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} \
  -DCMAKE_C_FLAGS_RELEASE=${CFLAGS} \
  -DCMAKE_C_FLAGS_DEBUG=${CFLAGS} \
  ${CMAKE_PLATFORM_FLAGS[@]} \
  ${SRC_DIR}
make -j${CPU_COUNT} ${VERBOSE_CM}

cd ../pycompwa
ln -s ../build/ui.*.so .
ln -s ../ComPWA/Physics/particle_list.xml .
