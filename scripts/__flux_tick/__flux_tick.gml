function __flux_tick() {
	// Ensure there is an instance of objFlux
	if(!instance_exists(global.__flux_object)) {
		global.__flux_object = instance_create_layer(0, 0, FLUX_TRANSITION_LAYER, objFlux);	
	}
	
	// Ensure that Layers are setup correctly. (This should only ever be called 1 time)
	if(global.__flux_layer == -1) {
		__flux_room_start();			
	}
	
	// Destroy Old Sequences
	if(global.__flux_old_timer > 0) {
		global.__flux_old_timer--;
		if(!is_undefined(global.__flux_old_sequence) && global.__flux_old_timer == 0) {
			if(layer_sequence_exists(global.__flux_layer, global.__flux_old_sequence)) {
				layer_sequence_destroy(global.__flux_old_sequence);	
			}
			global.__flux_old_sequence = undefined;
		}
	}
	
	// Only Run if Flux is Active
	if(!global.__flux_active) {
		return;	
	}
	
	// If no sequence exists, make sure flux doesn't run.
	if(!layer_sequence_exists(global.__flux_layer, global.__flux_sequence)) {
		global.__flux_sequence = undefined;
		global.__flux_active = false;
		return;
	}
	
	// Handle Flux Events
	
	// Don't continue if flux hasn't finished
	if(!layer_sequence_is_finished(global.__flux_sequence)) {
		return;	
	}
	
	// Handle Flux Sequence Destruction
	if(global.__flux_destroy_complete) {
		global.__flux_old_sequence = global.__flux_sequence;
		global.__flux_old_timer = 1;
		global.__flux_sequence = undefined;
	}
	
	// Handle Flux Callback
	if(!is_undefined(global.__flux_callback)) {
		global.__flux_callback(global.__flux_caller);	
	}
	
	// Reached End so clear variables
	if(is_undefined(global.__flux_sequence)) {
		global.__flux_callback = undefined;
		global.__flux_caller = undefined;
		global.__flux_events = {};
		global.__flux_sequence = undefined;
		
		global.__flux_active = false;
	}
	
	
}