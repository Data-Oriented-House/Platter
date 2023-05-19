package main

import "core:fmt"
import "shared:test"

main :: proc() {
	fmt.println("Hello, world!", test.hello())
}