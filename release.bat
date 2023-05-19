pushd %~dp0
odin run src/ -collection:shared=./shared -O:speed -no-bounds-check -disable-assert
popd