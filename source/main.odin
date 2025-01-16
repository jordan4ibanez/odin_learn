package main

import "core:fmt"
import "utility"
import rl "vendor:raylib"


main :: proc() {
	context.allocator = utility.initialize_heap_tracker(context)
	defer utility.terminate_heap_tracker(context.allocator)

	rl.SetTraceLogLevel(rl.TraceLogLevel.ERROR)

	rl.InitWindow(800, 800, "hi")
	defer rl.CloseWindow()

	


}
