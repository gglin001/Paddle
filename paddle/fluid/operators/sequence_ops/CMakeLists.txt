include(operators)
if(WITH_UNITY_BUILD)
    # Load Unity Build rules for operators in paddle/fluid/operators/sequence_ops.
    include(unity_build_rule.cmake)
endif()
register_operators(DEPS sequence_pooling sequence_padding im2col concat_and_split)
