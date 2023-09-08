# cc_library(
#   workqueue_utils
#   SRCS workqueue_utils.cc events_waiter.cc
#   DEPS enforce glog)
# cc_library(
#   workqueue
#   SRCS workqueue.cc
#   DEPS workqueue_utils enforce glog phi)
# cc_test(
#   workqueue_test
#   SRCS workqueue_test.cc
#   DEPS workqueue)

# set(workqueue_SRC
#     ${CMAKE_CURRENT_SOURCE_DIR}/workqueue_utils.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/events_waiter.cc
#     ${CMAKE_CURRENT_SOURCE_DIR}/workqueue.cc)
# set(workqueue_SRC
#     ${workqueue_SRC}
#     PARENT_SCOPE)

gather_srcs(standalone_executor_SRCS SRCS workqueue_utils.cc events_waiter.cc
            workqueue.cc)
