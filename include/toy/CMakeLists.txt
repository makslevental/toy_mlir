set(LLVM_TARGET_DEFINITIONS Ops.td)
mlir_tablegen(Ops.h.inc -gen-op-decls)
mlir_tablegen(Ops.cpp.inc -gen-op-defs)
mlir_tablegen(Dialect.h.inc -gen-dialect-decls)
mlir_tablegen(Dialect.cpp.inc -gen-dialect-defs)
add_public_tablegen_target(ToyCh2OpsIncGen)

set(LLVM_TARGET_DEFINITIONS Combine.td)
mlir_tablegen(Combine.inc -gen-rewriters)
add_public_tablegen_target(ToyCh3CombineIncGen)

# Most dialects should use add_mlir_interfaces().
set(LLVM_TARGET_DEFINITIONS ShapeInferenceInterface.td)
mlir_tablegen(ShapeInferenceOpInterfaces.h.inc -gen-op-interface-decls)
mlir_tablegen(ShapeInferenceOpInterfaces.cpp.inc -gen-op-interface-defs)
add_public_tablegen_target(ToyCh4ShapeInferenceInterfaceIncGen)
