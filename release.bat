pushd %~dp0
odin run src/ -out:./bin/Platter.exe -collection:shared=./shared -O:speed -no-bounds-check -disable-assert
popd