cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(quick-cliques)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 11)

# In case of Makefiles if the user does not setup CMAKE_BUILD_TYPE, assume it's Release:
if(CMAKE_GENERATOR MATCHES "Makefiles|Ninja" AND "${CMAKE_BUILD_TYPE}" STREQUAL "")
  message("-- No build type specified; defaulting to CMAKE_BUILD_TYPE=Release.")
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel." FORCE)
endif()

add_library(quick-cliques
  src/AdjacencyListAlgorithm.cpp
  src/Algorithm.cpp
  src/CliqueTools.cpp
  src/DegeneracyAlgorithm.cpp
  src/DegeneracyTools.cpp
  src/HybridAlgorithm.cpp
  src/MemoryManager.cpp
  src/TomitaAlgorithm.cpp
  src/Tools.cpp
)

target_include_directories(quick-cliques PUBLIC src)
target_compile_definitions(quick-cliques PUBLIC ALLOW_ALLOC_ZERO_BYTES)
target_compile_options(quick-cliques PRIVATE -Wno-error)

add_executable(qc src/main.cpp)
target_link_libraries(qc quick-cliques)
target_compile_options(qc PRIVATE -Wno-error)

add_executable(printnm src/printnm.cpp)
target_link_libraries(printnm quick-cliques)
target_compile_options(printnm PRIVATE -Wno-error)

add_executable(compdegen src/compdegen.cpp)
target_link_libraries(compdegen quick-cliques)
target_compile_options(compdegen PRIVATE -Wno-error)
