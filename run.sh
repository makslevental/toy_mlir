./cmake-build-debug/toy main.toy -emit=ast 2> main.ast
./cmake-build-debug/toy main.toy -emit=mlir 2> main.mlir
./cmake-build-debug/toy main.toy -emit=mlir -opt 2> main_opt.mlir
