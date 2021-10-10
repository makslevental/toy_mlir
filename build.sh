cmake -DCMAKE_BUILD_TYPE=Debug -B/Users/mlevental/dev_projects/toy_mlir/cmake-build-debug \
 -DLLVM_DIR=/Users/mlevental/dev_projects/llvm-project/build/lib/cmake/llvm/ \
 -DMLIR_DIR=/Users/mlevental/dev_projects/llvm-project/build/lib/cmake/mlir/ \
 -G Ninja -S/Users/mlevental/dev_projects/toy_mlir;
cmake --build /Users/mlevental/dev_projects/toy_mlir/cmake-build-debug --target toy -- -j 12;

