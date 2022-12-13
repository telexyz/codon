sudo apt install clang cmake ninja python3-tk
ln -s /usr/lib/python3.10/config-3.10-x86_64-linux-gnu/libpython3.10.so libpython.so
pip install matplotlib

git clone --depth 1 -b codon https://github.com/exaloop/llvm-project
git clone https://github.com/exaloop/codon.git

# rm -rf llvm-project/build
# cmake -S llvm-project/llvm -B llvm-project/build -G Ninja \
#     -DCMAKE_BUILD_TYPE=Release \
#     -DLLVM_INCLUDE_TESTS=OFF \
#     -DLLVM_ENABLE_RTTI=ON \
#     -DLLVM_ENABLE_ZLIB=OFF \
#     -DLLVM_ENABLE_TERMINFO=OFF \
#     -DLLVM_TARGETS_TO_BUILD=all

# cd codon
# rm -rf build; mkdir -p build
# cd build
# cmake .. -DCMAKE_BUILD_TYPE=Release -DCODON_GPU=ON \
# 	-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++

rm -rf codon/build
cmake -S codon -B codon/build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release -DCODON_GPU=ON \
    -DLLVM_DIR=$(llvm-config --cmakedir) \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++

./update.sh