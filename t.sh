# cmake config 

# cmake build all/paddle_python with dbg libs

# cp files
cp build/paddle/fluid/pybind/libpaddle_pybind.so python/paddle/fluid/core_avx.so
cp -r build/python/paddle/fluid/proto/ python/paddle/fluid/
cp -r build/python/paddle/version python/paddle/
cp -r build/python/paddle/distributed/fleet/proto/ python/paddle/distributed/fleet
