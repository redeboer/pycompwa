#!/bin/bash

CMAKE_PLATFORM_FLAGS+=(-DCMAKE_TOOLCHAIN_FILE="${RECIPE_DIR}/cross-linux.cmake")

if [[ ${DEBUG_C} == yes ]]; then
  CMAKE_BUILD_TYPE=Debug
else
  CMAKE_BUILD_TYPE=Release
fi

echo
echo "SRC_DIR:              ${SRC_DIR}"
echo "RECIPE_DIR:           ${RECIPE_DIR}"
echo "CPU_COUNT:            ${CPU_COUNT}"
echo "CMAKE_GENERATOR:      ${CMAKE_GENERATOR}"
echo "CMAKE_PLATFORM_FLAGS: ${CMAKE_PLATFORM_FLAGS}"
echo

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
