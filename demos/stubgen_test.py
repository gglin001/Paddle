import paddle
import paddle.fluid

# import paddle.fluid.core
# import paddle.fluid.libpaddle
# import paddle.fluid.libpaddle.eager

# test if stubgen work
# stubgen can only generate basic API names

paddle.fluid.core.set_autotune_range()
paddle.fluid.core.eager.ops.accuracy()
paddle.fluid.core.eager.ops.legacy.accuracy()

a = paddle.fluid.core.eager.Tensor()
# a = paddle.fluid.libpaddle.eager.Tensor()
# a = paddle.Tensor()
a.abs

paddle.to_tensor
