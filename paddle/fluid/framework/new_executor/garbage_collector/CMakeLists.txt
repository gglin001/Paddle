# cc_library(
#   interpretercore_garbage_collector NOT_FOR_INFER
#   SRCS garbage_collector.cc event_garbage_collector.cc fast_garbage_collector.cc
#        no_event_garbage_collector.cc
#   DEPS garbage_collector executor_gc_helper)

# set(garbage_collector_SRC
#     ${CMAKE_CURRENT_SOURCE_DIR}/garbage_collector.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/event_garbage_collector.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/fast_garbage_collector.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/no_event_garbage_collector.cc)
# set(garbage_collector_SRC
#     ${garbage_collector_SRC}
#     PARENT_SCOPE)

gather_srcs(
  standalone_executor_SRCS SRCS garbage_collector.cc event_garbage_collector.cc
  fast_garbage_collector.cc no_event_garbage_collector.cc)
