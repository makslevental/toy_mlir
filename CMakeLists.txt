cmake_minimum_required(VERSION 3.13.4)
project(toy_mlir LANGUAGES CXX C)

#################
# boiler plate
#################

set(CMAKE_CXX_STANDARD 14 CACHE STRING "C++ standard to conform to")

find_package(LLVM REQUIRED CONFIG NO_SYSTEM_ENVIRONMENT_PATH NO_DEFAULT_PATH NO_CMAKE_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)
find_package(MLIR REQUIRED CONFIG NO_SYSTEM_ENVIRONMENT_PATH NO_DEFAULT_PATH NO_CMAKE_ENVIRONMENT_PATH NO_CMAKE_SYSTEM_PATH)

message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")

# MLIRConfig.cmake and such (which is generated when building MLIR)
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

# can't find command mlir_tblgen
include(TableGen)
include(AddMLIR)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
message("${PROJECT_BINARY_DIR}")
include_directories(${PROJECT_SOURCE_DIR}/include)
# fatal error: 'toy/Dialect.h.inc' file not found
include_directories(${PROJECT_BINARY_DIR}/include)

#################
# project specific
#################

# no clue why but this solves Undefined symbols for architecture x86_64: "typeinfo for llvm::cl::GenericOptionValue", referenced from: errors
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

add_subdirectory(include/toy)
add_executable(toy
        src/toy.cpp
        src/AST.cpp
        src/Dialect.cpp
        src/MLIRGen.cpp
        src/Combine.cpp)
add_dependencies(toy ToyCh2OpsIncGen ToyCh3CombineIncGen)

llvm_map_components_to_libnames(llvm_libs Support)
target_link_libraries(toy
        ${llvm_libs}
        MLIRAnalysis
        MLIRCastInterfaces
        MLIRCallInterfaces
        MLIRIR
        MLIRParser
        MLIRSideEffectInterfaces
        MLIRTransforms)

