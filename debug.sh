#!/usr/bin/bash
cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
odin run src -out:./bin/Platter -collection:shared=./shared -strict-style -warnings-as-errors -show-timings -debug -vet