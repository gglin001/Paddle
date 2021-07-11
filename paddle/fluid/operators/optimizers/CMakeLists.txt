include(operators)
if(WITH_UNITY_BUILD)
    # Load Unity Build rules for operators in paddle/fluid/operators/optimizers.
    include(unity_build_rule.cmake)
endif()
register_operators(EXCLUDES dgc_momentum_op DEPS eigen_function paddle_framework)

op_library(dgc_momentum_op SRCS dgc_momentum_op.cc DEPS ${OP_HEADER_DEPS} ${op_common_deps} momentum_op)
