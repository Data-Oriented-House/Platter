pushd %~dp0
odin run src/ -collection:shared=./shared -strict-style -warnings-as-errors -show-timings -debug -vet
popd