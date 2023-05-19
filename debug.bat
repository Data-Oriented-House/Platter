pushd %~dp0
odin run src/ -out:./bin/Platter.exe -collection:shared=./shared -strict-style -warnings-as-errors -show-timings -debug -vet
popd