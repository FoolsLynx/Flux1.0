///------------------------------------------------------
/// Flux Destroy
///------------------------------------------------------
/// Tells flux to destroy the current the active sequence
///------------------------------------------------------

function flux_destroy(_callback = undefined, _caller = undefined) {
	// Setup Sequence for Destruction
	global.__flux_old = global.__flux_sequence;
	global.__flux_old_timer = 1;
	global.__flux_sequence = undefined;
	
	// Reset Destroy State
	global.__flux_destroy_done = true;
	
	// Clear Flux Events
	global.__flux_events = {};
	
	// If sequence is finished execute callbacks
	if(!is_undefined(_callback)) {
		_callback(is_undefined(_caller) ? self : _caller);
	}
	
	// Reset Transition State if a new sequence wasnt created
	if(is_undefined(global.__flux_sequence)) {
		global.__flux_active = false;
		// Clear Callback
		global.__flux_callback = undefined;
		global.__flux_caller = undefined;
		// Clear Events
		// Set Buffer Timer
		global.__flux_buffer_timer = FLUX_BUFFER_TIMER;
		// Set Flux Phase
		global.__flux_phase = "done";
	}
}