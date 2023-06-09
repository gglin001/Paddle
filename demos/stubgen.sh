# cmake --build /repos/gglin001/Paddle/build --config Release --target all
apt install patch patchelf

pip install -r python/requirements.txt
pip install mypy

# stubgen \
#     -m paddle.fluid.libpaddle \
#     -m paddle.fluid.libpaddle.eager \
#     -o build/python
# stubgen \
#     -m paddle.fluid.core \
#     -o build/python

# cmake --build `pwd`/build --config Release --target paddle
cp build/paddle/fluid/pybind/libpaddle.so python/paddle/fluid/

cp -r build/python/paddle/fluid/proto python/paddle/fluid/
cp -r build/python/paddle/distributed/fleet/proto python/paddle/distributed/fleet/
cp -r build/python/paddle/version python/paddle

stubgen \
    -m paddle.fluid.libpaddle \
    -m paddle.fluid.libpaddle.eager \
    -m paddle.fluid.libpaddle.eager.ops \
    -m paddle.fluid.libpaddle.eager.ops.legacy \
    -o python \
    -v

echo "from . import eager" >>python/paddle/fluid/libpaddle/__init__.pyi
echo "from . import ops" >>python/paddle/fluid/libpaddle/eager/__init__.pyi
echo "from . import legacy" >>python/paddle/fluid/libpaddle/eager/ops/__init__.pyi

# optional
echo "from .fluid.libpaddle.eager.ops import *" >>python/paddle/_C_ops.pyi
echo "from .fluid.libpaddle.eager.ops.legacy import *" >>python/paddle/_legacy_C_ops.pyi

# optional
echo "from . import fluid" >>python/paddle/__init__.py
echo "from . import static" >>python/paddle/__init__.py

# no need
# stubgen \
#     -m paddle.fluid.core \
#     -o python
