# cmake --build /repos/gglin001/Paddle/build --config Release --target all
apt install patch patchelf

pip install -r python/requirements.txt
pip install mypy

# stubgen \
#     -m paddle.base.libpaddle \
#     -m paddle.base.libpaddle.eager \
#     -o build/python
# stubgen \
#     -m paddle.base.core \
#     -o build/python

stubgen \
    -m paddle.base.libpaddle \
    -m paddle.base.libpaddle.eager \
    -m paddle.base.libpaddle.eager.ops \
    -m paddle.base.libpaddle.eager.ops.legacy \
    -o python \
    -v

echo "from . import eager" >>python/paddle/base/libpaddle/__init__.pyi
echo "from . import ops" >>python/paddle/base/libpaddle/eager/__init__.pyi
echo "from . import legacy" >>python/paddle/base/libpaddle/eager/ops/__init__.pyi

# optional
echo "from .base.libpaddle.eager.ops import *" >>python/paddle/_C_ops.pyi
echo "from .base.libpaddle.eager.ops.legacy import *" >>python/paddle/_legacy_C_ops.pyi

# optional
echo "from . import base" >>python/paddle/__init__.py
echo "from . import static" >>python/paddle/__init__.py

# no need
# stubgen \
#     -m paddle.base.core \
#     -o python
