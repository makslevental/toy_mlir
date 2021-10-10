./cmake-build-debug/toy main.toy -emit=ast 2> main.ast
./cmake-build-debug/toy main.toy -emit=mlir -mlir-print-debuginfo 2> main.mlir
