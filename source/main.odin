package main

import "core:fmt"
import "core:math/rand"
import "core:strings"

@(private)
X :: "hi"

blah :: proc() {
	fmt.println("blah!")
}

lots_o_vars :: proc(x, y, z: i32) {
	fmt.println(x, y, z)
}


@(private)
/*
Count from 1 to 10.
*/
recurse :: proc(index: ^i32) -> i32 {

	index^ += 1

	fmt.println("in recursive", index^)

	if index^ >= 10 {
		return index^
	}

	return recurse(index)
}

main :: proc() {

	asdf := 1

	I_AM_A_CONSTANT :: "hi"

	defer fmt.println("bye")

	fmt.println(blah, "and hi", I_AM_A_CONSTANT)

	for i := 0; i < 10; i += 1 {
		fmt.println(i)
	}

	for i := 0; i < 10; i += 1 do blah()

	for i in 0 ..< 10 {
		fmt.println("hi", i)
	}


	for char in I_AM_A_CONSTANT {
		fmt.println(char)
	}

	fmt.println(I_AM_A_CONSTANT[0:1])

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

	for &i in boof {
		i *= 2
	}

	boof2 := []f32{2, 2, 2, 2, 2, 2, 2}

	fmt.println(boof)

	for i in 0 ..< len(boof2) {
		boof[i] /= boof2[i]
	}

	fmt.println(boof)

	#reverse for i in boof {
		fmt.println(i)
	}


	if (boof[2] >= 20) {
		fmt.println("yep that's greater")
	}

	randy := rand.float32()

	fmt.println(randy)
	if (randy > 0.5) {
		fmt.println("true!")
	} else {
		fmt.println("false!")
	}

	{
		defer fmt.println("scope end")
	}


	#partial switch arch := ODIN_ARCH; arch {
	case .i386:
		fmt.println("old")
	case .amd64:
		fmt.println("new")
	}

	o: i32 = 0
	fmt.println("did we reach 10?", recurse(&o))

	lots_o_vars(1, 2, 3)

	asf := 0
	fmt.println(testing(asf))

	fmt.println(fmt.printfln("hi", "hi"))

	named_arg(input = "hi")

	named_arg()

	fmt.println(add(1, 1))
	fmt.println(add("hi", " there"))

}

testing :: proc(input: int) -> (output: int) {
	output = input + 1
	return
}

named_arg :: proc(input: string = "nothing here") {
	fmt.println("this is a named string:", input)
}

add_int :: proc(x, y: int) -> int {
	return x + y
}

add_str :: proc(x, y: string) -> string {
	return strings.concatenate({x, y})
}

add :: proc {
	add_int,
	add_str,
}
