package main

import "core:fmt"

@(private)
x :: "hi"

main :: proc() {

	blah: int = 3

	iAmAConstant :: "hi"


	fmt.println(blah, "and hi", iAmAConstant)

	for i := 0; i < 10; i += 1 {
		fmt.println(i)
	}


}
