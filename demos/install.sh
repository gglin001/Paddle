# cmake buyild target `paddle`
# cmake --build `pwd`/build --config Release --target paddle

pip install -r python/requirements.txt

cp -rf build/python/paddle/base/proto python/paddle/base/
cp -rf build/python/paddle/distributed/fleet/proto python/paddle/distributed/fleet/
cp -rf build/python/paddle/version python/paddle
cp build/python/paddle/cuda_env.py python/paddle/cuda_env.py

cp build/python/paddle/base/libpaddle.so python/paddle/base/libpaddle.so
cp -rf build/python/paddle/libs python/paddle/
