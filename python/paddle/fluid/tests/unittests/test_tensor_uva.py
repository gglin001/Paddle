# Copyright (c) 2022 PaddlePaddle Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import paddle
import unittest
import numpy as np
from paddle.fluid import core
from paddle.fluid.framework import _test_eager_guard, _in_legacy_dygraph


class TestTensorCopyFrom(unittest.TestCase):

    def func_main(self):
        if paddle.fluid.core.is_compiled_with_cuda():
            place = paddle.CPUPlace()
            np_value = np.random.random(size=[10, 30]).astype('float32')
            tensor = paddle.to_tensor(np_value, place=place)
            tensor._uva()
            self.assertTrue(tensor.place.is_gpu_place())

    def test_main(self):
        with _test_eager_guard():
            self.func_main()
        self.func_main()


class TestUVATensorFromNumpy(unittest.TestCase):

    def func_uva_tensor_creation(self):
        if paddle.fluid.core.is_compiled_with_cuda():
            dtype_list = [
                "int32", "int64", "float32", "float64", "float16", "int8",
                "int16", "bool"
            ]
            for dtype in dtype_list:
                data = np.random.randint(10, size=[4, 5]).astype(dtype)
                if _in_legacy_dygraph():
                    tensor = paddle.fluid.core.to_uva_tensor(data, 0)
                    tensor2 = paddle.fluid.core.to_uva_tensor(data)
                else:
                    tensor = core.eager.to_uva_tensor(data, 0)
                    tensor2 = core.eager.to_uva_tensor(data)

                self.assertTrue(tensor.place.is_gpu_place())
                self.assertTrue(tensor2.place.is_gpu_place())
                np.testing.assert_allclose(tensor.numpy(), data, rtol=1e-05)
                np.testing.assert_allclose(tensor2.numpy(), data, rtol=1e-05)

    def test_uva_tensor_corectness(self):
        if paddle.fluid.core.is_compiled_with_cuda():
            a = np.arange(0, 100, dtype="int32")
            a = a.reshape([10, 10])
            slice_a = a[:, 5]
            tensor1 = paddle.to_tensor(slice_a)
            tensor2 = core.eager.to_uva_tensor(slice_a)
            np.testing.assert_allclose(tensor1.numpy(),
                                       tensor2.numpy(),
                                       rtol=1e-05)

    def test_uva_tensor_creation(self):
        with _test_eager_guard():
            self.func_uva_tensor_creation()
        self.func_uva_tensor_creation()


if __name__ == "__main__":
    unittest.main()
