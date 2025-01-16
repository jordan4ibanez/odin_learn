package heap_tracker

import "core:fmt"
import "core:mem"

@(private)
track: mem.Tracking_Allocator

/*
Initializes the tracing allocator.
*/
initialize :: proc() {
	mem.tracking_allocator_init(&track, context.allocator)
	context.allocator = mem.tracking_allocator(&track)
}

/*
Terminates the tracing allocator.
Then tells me where I done goofed.
*/
terminate :: proc() {
	if len(track.allocation_map) > 0 {
		fmt.eprintf("=== %v allocations not freed: ===\n", len(track.allocation_map))
		for _, entry in track.allocation_map {
			fmt.eprintf("- %v bytes @ %v\n", entry.size, entry.location)
		}
	}
	if len(track.bad_free_array) > 0 {
		fmt.eprintf("=== %v incorrect frees: ===\n", len(track.bad_free_array))
		for entry in track.bad_free_array {
			fmt.eprintf("- %p @ %v\n", entry.memory, entry.location)
		}
	}
	mem.tracking_allocator_destroy(&track)
}