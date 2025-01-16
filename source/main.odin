package main

import "core:fmt"
import "utility/heap_tracker"


main :: proc() {
	heap_tracker.initialize()
	defer heap_tracker.terminate()

}
