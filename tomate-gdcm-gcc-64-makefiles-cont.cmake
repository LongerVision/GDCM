# Client maintainer: mathieu . malaterre  gmail . com

set(CTEST_SITE "tomate")
set(CTEST_BUILD_NAME "Linux-gcc-GIT-cont")
set(CTEST_BUILD_CONFIGURATION Debug)
set(CTEST_CMAKE_GENERATOR "Unix Makefiles")
set(CTEST_DASHBOARD_ROOT "/local/mmalater")
set(dashboard_root_name "MyTests")
SET(CTEST_BUILD_FLAGS "-j16")
set(dashboard_source_name "gdcm-cont")
set(dashboard_binary_name "gdcm-gcc-tomate-cont")
set(dashboard_do_memcheck FALSE)
set(dashboard_do_coverage FALSE)
set(dashboard_model Continuous)
set(CTEST_TEST_TIMEOUT 3000)

SET(ENV{PATH} "$ENV{HOME}/Software/cmake-2.8.2-Linux-i386/bin:$ENV{PATH}:/local/mmalater/install/bin/")

macro(dashboard_hook_init)
  set( dashboard_cache "
GDCM_BUILD_SHARED_LIBS:BOOL=ON
GDCM_BUILD_APPLICATIONS:BOOL=ON
GDCM_BUILD_EXAMPLES:BOOL=ON
GDCM_USE_VTK:BOOL=ON
# Cannot use CTEST_DASHBOARD_ROOT directly...
VTK_DIR:PATH=${CTEST_DASHBOARD_ROOT}/VTK-gcc-tomate
CMAKE_INSTALL_PREFIX:PATH=/tmp/tomate-gdcm
GDCM_USE_SYSTEM_OPENSSL:BOOL=ON
GDCM_TEST_DCMTK:BOOL=ON
GDCM_DATA_EXTRA_ROOT:PATH=${CTEST_DASHBOARD_ROOT}/gdcmDataExtra
    "
    )
endmacro(dashboard_hook_init)

include(${CTEST_SCRIPT_DIRECTORY}/gdcm_common.cmake)