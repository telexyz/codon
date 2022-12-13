cd codon && git pull && cd ..
cd llvm-project && git pull && cd ..

# cmake --build llvm-project/build
# cmake --install llvm-project/build
cmake --build codon/build --config Release
# cd codon/build && make -j12