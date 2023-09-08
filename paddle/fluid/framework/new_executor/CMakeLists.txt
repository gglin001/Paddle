add_subdirectory(garbage_collector)
add_subdirectory(instruction)
add_subdirectory(interpreter)
add_subdirectory(workqueue)

gather_srcs(
  standalone_executor_SRCS
  SRCS
  feed_fetch_utils.cc
  interpretercore.cc
  new_executor_defs.cc
  standalone_executor.cc
  program_interpreter.cc
  new_ir_interpreter.cc)

# set(STANDALONE_EXECUTOR_SRCS
#     ${garbage_collector_SRC}
#     ${instruction_SRC}
#     ${interpreter_SRC}
#     ${workqueue_SRC}
#     feed_fetch_utils.cc
#     interpretercore.cc
#     new_executor_defs.cc
#     standalone_executor.cc
#     program_interpreter.cc
#     new_ir_interpreter.cc)

set(standalone_executor_DEPS
    interpreter
    interpretercore_garbage_collector
    workqueue
    pd_dialect
    pd_op_to_kernel_pass
    phi_kernel_adaptor
    program_translator
    instruction_base
    pd_inplace_pass
    ir)

message("standalone_executor_SRCS: ${standalone_executor_SRCS}")
cc_library(
  standalone_executor
  SRCS ${standalone_executor_SRCS}
  DEPS ${standalone_executor_DEPS})

cc_library(
  staticgraph_executor_statistics
  SRCS executor_statistics.cc
  DEPS enforce glog phi)
