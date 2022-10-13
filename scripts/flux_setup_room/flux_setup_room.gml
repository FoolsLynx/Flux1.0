function flux_setup_room(_room, _sequence, _callback = undefined, _caller = undefined){
	flux_setup_room_ext(_room, _sequence, _callback, _caller);
}

function flux_setup_room_ext(_room, _sequence, _callback = undefined, _caller = undefined, _speed = 1, _rot = 0, _destroy = true) {
	layer_set_target_room(_room);
	
	
	global.__flux_target_sequence = __flux_place_sequence(_sequence, 0, 0,  layer_get_id(FLUX_TRANSITION_LAYER));
	layer_sequence_speedscale(global.__flux_target_sequence, _speed);
	layer_sequence_angle(global.__flux_target_sequence, _rot);
	
	// Setup Callback
	if(is_undefined(_caller)) _caller = self;
	global.__flux_target_callback = _callback;
	global.__flux_target_caller = _caller;
	
	// Setup Destruction
	global.__flux_target_destroy_complete = _destroy;
	
	// Reset Room Target
	layer_reset_target_room();
}