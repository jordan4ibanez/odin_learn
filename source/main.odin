package main

import "core:fmt"

@(private)
x :: "hi"

blah :: proc() {
	fmt.println("blah!")
}

main :: proc() {

	iAmAConstant :: "hi"

	fmt.println(blah, "and hi", iAmAConstant)

	for i := 0; i < 10; i += 1 {
		fmt.println(i)
	}

	for i := 0; i < 10; i += 1 do blah()

	


}
