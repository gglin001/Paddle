# cc_library(
#   instruction_base
#   SRCS instruction_base.cc phi_kernel_instruction.cc
#        legacy_kernel_instruction.cc instruction_util.cc
#   DEPS phi framework_proto)

# if(WITH_CINN AND NOT CINN_ONLY)
#   cc_library(
#     cinn_jit_instruction NOT_FOR_INFER
#     SRCS cinn_jit_instruction.cc
#     DEPS phi cinnapi cinn_dialect runtime_dialect)
# endif()

# set(instruction_SRC
#     ${CMAKE_CURRENT_SOURCE_DIR}/instruction_base.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/phi_kernel_instruction.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/legacy_kernel_instruction.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/instruction_util.cc)
# if(WITH_CINN AND NOT CINN_ONLY)
#   list(APPEND instruction_SRC
#        ${CMAKE_CURRENT_SOURCE_DIR}/cinn_jit_instruction.cc)
# endif()
# set(instruction_SRC
#     ${instruction_SRC}
#     PARENT_SCOPE)

gather_srcs(
  standalone_executor_SRCS SRCS instruction_base.cc phi_kernel_instruction.cc
  legacy_kernel_instruction.cc instruction_util.cc)
if(WITH_CINN AND NOT CINN_ONLY)
  gather_srcs(standalone_executor_SRCS SRCS cinn_jit_instruction.cc)
endif()
