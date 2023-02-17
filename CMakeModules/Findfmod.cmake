set(FMOD_ROOT CACHE PATH "Root directory of FMOD")

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(FMOD_NAME_ARCH "64")
elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)
	set(FMOD_NAME_ARCH "")
endif (CMAKE_SIZEOF_VOID_P EQUAL 8)

find_path(FMODSTUDIO_INCLUDE_DIR NAMES fmod_studio.h fmod_studio.hpp PATHS ${FMOD_ROOT}/api/studio/inc)
find_library(FMODSTUDIO_LIBRARIES NAMES fmodstudio${FMOD_NAME_ARCH}_vc.lib PATHS ${FMOD_ROOT}/api/studio/lib)
find_path(FMODSTUDIO_MODULE_DIR NAMES fmodstudio${FMOD_NAME_ARCH}.dll PATHS ${FMOD_ROOT}/api/studio/lib)

find_path(FMOD_INCLUDE_DIR NAMES fmod.h fmod.hpp PATHS ${FMOD_ROOT}/api/lowlevel/inc)
find_library(FMOD_LIBRARIES NAMES fmod${FMOD_NAME_ARCH}_vc.lib PATHS ${FMOD_ROOT}/api/lowlevel/lib)
find_path(FMOD_MODULE_DIR NAMES fmod${FMOD_NAME_ARCH}.dll PATHS ${FMOD_ROOT}/api/lowlevel/lib)
set(FMOD_MODULES "${FMOD_MODULE_DIR}/fmod${FMOD_NAME_ARCH}.dll")
set(FMODSTUDIO_MODULES ${FMOD_MODULES} "${FMODSTUDIO_MODULE_DIR}/fmodstudio${FMOD_NAME_ARCH}.dll")

if (FMODSTUDIO_INCLUDE_DIR AND FMODSTUDIO_LIBRARIES AND FMODSTUDIO_MODULE_DIR AND
    FMOD_INCLUDE_DIR AND FMOD_LIBRARIES AND FMOD_MODULE_DIR)
   set(FMOD_FOUND TRUE)
   message(STATUS "Found FMOD: ${FMOD_ROOT}")
endif (FMODSTUDIO_INCLUDE_DIR AND FMODSTUDIO_LIBRARIES AND FMODSTUDIO_MODULE_DIR AND
    FMOD_INCLUDE_DIR AND FMOD_LIBRARIES AND FMOD_MODULE_DIR)
