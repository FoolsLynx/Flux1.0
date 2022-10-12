///------------------------------------------------------------------
/// Flux Tick
///------------------------------------------------------------------
/// This script will be called once every frame. It contains the 
/// logic that will make the transition system work.
///
/// It contains code that will ensure that the layers are set
/// correctly and that the scripts will run when needed.
///------------------------------------------------------------------


function __flux_tick() {	
	// Wait for buffer timer to complete before continuing
	if(global.__flux_buffer_timer > 0) {
		global.__flux_buffer_timer--;
		return;
	}	
	
	// Check if we are in a different room
	if(global.__flux_current_room != room) {
		// Get the Correct Layer
		global.__flux_layer = layer_get_id(FLUX_LAYER);		
		// Setup Layer Script
		layer_script_begin(global.__flux_layer, __flux_layer_begin);
		layer_script_end(global.__flux_layer, __flux_layer_end);
		global.__flux_current_room = room;
		// Ensure Transition happens on the correct view
		global.__flux_view = view_camera[0];
	}
	
	// Check if transition layer is -1
	if(global.__flux_layer == -1) {
		// Get the Correct Layer
		global.__flux_layer = layer_get_id(FLUX_LAYER);		
		// Setup Layer Script
		layer_script_begin(global.__flux_layer, __flux_layer_begin);
		layer_script_end(global.__flux_layer, __flux_layer_end);
	}
	
	// Handle Sequence Destruction
	if(global.__flux_old_timer > 0) {
		global.__flux_old_timer--;
		// Destroy Old Sequence
		if(global.__flux_old_timer == 0 && !is_undefined(global.__flux_old)) {
			if(layer_sequence_exists(global.__flux_layer, global.__flux_old)) {
				layer_sequence_destroy(global.__flux_old);
			}
			global.__flux_old = undefined;
		}
	}
	
	// Do not run if no transition is active
	if(!global.__flux_active) return;
	
	// Create our surface
	if(is_undefined(global.__flux_surface)) {
		global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);
	}
	
	// Check if Surface Exists
	if(!surface_exists(global.__flux_surface)) {
		surface_free(global.__flux_surface);
		global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);
	}
	
	// Check if sequence is undefined
	if(is_undefined(global.__flux_sequence)) {
		global.__flux_active = false;
		return;
	}
	
	// Get Head Position
	var _pos = layer_sequence_get_headpos(global.__flux_sequence);
	var _ev = global.__flux_events[$ _pos];
	if(is_array(_ev)) {
		var _i = 0;
		var _count = array_length(_ev);
		repeat(_count) {
			_ev[_i].callback(_ev[_i].caller);
			_i++;
		}
	}
	
	
	// Return if sequence is not finished
	if(!layer_sequence_is_finished(global.__flux_sequence)) {
		return;	
	}
	
	if(global.__flux_destroy_done) {
		flux_destroy(global.__flux_callback, global.__flux_caller);
		//// Setup Sequence for Destruction
		//global.__flux_old = global.__flux_sequence;
		//global.__flux_old_timer = 1;
		//global.__flux_sequence = undefined;
		//
		//// If sequence is finished execute callbacks
		//if(!is_undefined(global.__flux_callback)) {
		//	global.__flux_callback(global.__flux_callback_caller);
		//}
		//
		//// Reset Transition State if a new sequence wasnt created
		//if(is_undefined(global.__flux_sequence)) {
		//	global.__flux_active = false;
		//	// Clear Callback
		//	global.__flux_callback = undefined;
		//	global.__flux_caller = undefined;
		//	// Set Buffer Timer
		//	global.__flux_buffer_timer = FLUX_BUFFER_TIMER;
		//	
		//	global.__flux_phase = "done";
		//}
	} else {
		// Set ourselves to the waiting phase
		if(global.__flux_phase != "waiting") {
			global.__flux_phase = "waiting";
			// Call the Callback at the start of waiting
			if(!is_undefined(global.__flux_callback)) {
				global.__flux_callback(global.__flux_callback_caller);
			}
		}
	}
}
