#!/usr/bin/bash
cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
odin run src/ -collection:shared=./shared -strict-style -warnings-as-errors -show-timings -debug -vet