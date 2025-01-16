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

	for i in 0 ..< 10 {
		fmt.println("hi", i)
	}


	for char in iAmAConstant {
		fmt.println(char)
	}

	fmt.println(iAmAConstant[0:1])

	y := 10

	boof := []f32{0, 324, 23, 423, 432, 432, 4234}

	for i, x in boof {
		fmt.println(x, i)
	}
	{
		i := 1
		fmt.println("hi", i)
	}


	for i in "hello" {
		fmt.print(i, " ")
	}

	fmt.println()




}
