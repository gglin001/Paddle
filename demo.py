# from https://www.paddlepaddle.org.cn/documentation/docs/zh/api/paddle/nn/Conv2D_cn.html

import paddle
import paddle.nn as nn

x_var = paddle.uniform((2, 4, 8, 8), dtype='float32', min=-1., max=1.)

conv = nn.Conv2D(4, 6, (3, 3))
y_var = conv(x_var)
y_np = y_var.numpy()
print(y_np.shape)
# (2, 6, 6, 6)
