package heap_tracker

import "base:runtime"
import "core:fmt"
import "core:mem"


/*
Initializes the tracing allocator.
*/
initialize :: proc(con: runtime.Context) -> mem.Allocator {
	track := new(mem.Tracking_Allocator)
	mem.tracking_allocator_init(track, con.allocator)
	return mem.tracking_allocator(track)
}

/*
Terminates the tracing allocator.
Then tells me where I done goofed.
*/
terminate :: proc(allo: mem.Allocator) {

	track := cast(^mem.Tracking_Allocator)allo.data

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
	mem.tracking_allocator_destroy(track)
}
