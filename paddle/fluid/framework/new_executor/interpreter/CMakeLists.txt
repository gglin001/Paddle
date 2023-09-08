# set(INTERPRETER_SRCS
#     ${CMAKE_CURRENT_SOURCE_DIR}/data_transfer.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/dependency_builder.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/execution_config.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/interpreter_util.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/static_build.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/stream_analyzer.cc)

# set(INTERPRETER_DEPS
#     buffered_reader
#     device_context
#     global_utils
#     op_registry
#     scope
#     framework_proto
#     data_feed_proto
#     ops_extra_info
#     heter_service_proto
#     trainer_desc_proto
#     glog
#     lod_rank_table
#     fs
#     shell
#     fleet_wrapper
#     heter_wrapper
#     ps_gpu_wrapper
#     box_wrapper
#     lodtensor_printer
#     feed_fetch_method
#     graph_to_program_pass
#     variable_helper
#     timer
#     monitor
#     nan_inf_utils
#     enforce
#     scope
#     glog
#     phi
#     ${DEVICE_EVENT_LIBS}
#     glog)

# if(WITH_CINN AND NOT CINN_ONLY)
#   set(INTERPRETER_DEPS ${INTERPRETER_DEPS} cinn_jit_instruction)
# endif()

# cc_library(
#   interpreter
#   SRCS ${INTERPRETER_SRCS}
#   DEPS standalone_executor ${INTERPRETER_DEPS})

# cc_library(
#   plan
#   SRCS plan.cc
#   DEPS framework_proto)

# set(interpreter_SRC ${INTERPRETER_SRCS} ${INTERPRETER_DEPS})
# if(WITH_CINN AND NOT CINN_ONLY)
#   list(APPEND interpreter_SRC
#        ${CMAKE_CURRENT_SOURCE_DIR}/cinn_jit_interpreter.cc)
# endif()
# set(interpreter_SRC
#     ${interpreter_SRC}
#     PARENT_SCOPE)

gather_srcs(
  standalone_executor_SRCS
  SRCS
  data_transfer.cc
  dependency_builder.cc
  execution_config.cc
  interpreter_util.cc
  static_build.cc
  stream_analyzer.cc)

if(WITH_CINN AND NOT CINN_ONLY)
  gather_srcs(standalone_executor_SRCS SRCS cinn_jit_interpreter.cc)
endif()
