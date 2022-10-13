function flux_start_ext(_sequence, _callback = undefined, _caller = undefined, _speed = 1, _rot = 0, _destroy = true){
	// Destroy Exists
	if(!is_undefined(global.__flux_sequence)) {
		global.__flux_old_sequence = global.__flux_sequence;
		global.__flux_old_timer = 1;
		global.__flux_sequence = undefined;
	}
	
	// Set Callback
	flux_setup_callback(_callback, _caller);
	
	// Set Destory State
	global.__flux_destroy_complete = _destroy;
	
	// Create Sequence
	global.__flux_sequence = __flux_place_sequence(_sequence, 0, 0);
	layer_sequence_speedscale(global.__flux_sequence, _speed);
	layer_sequence_angle(global.__flux_sequence, _rot);
	
	// Activate Flux
	global.__flux_active = true;
}