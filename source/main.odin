package main

import "core:fmt"
import "utility/heap_tracker"


main :: proc() {
	context.allocator = heap_tracker.initialize(context)
	defer heap_tracker.terminate(context.allocator)

	blah := new(int)

}
