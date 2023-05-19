#!/usr/bin/bash
cd $( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
odin run src/ -collection:shared=./shared -O:speed -no-bounds-check -disable-assert