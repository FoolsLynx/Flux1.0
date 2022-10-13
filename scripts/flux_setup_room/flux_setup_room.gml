function flux_setup_room(_room, _sequence, _callback = undefined, _caller = undefined){
	flux_setup_room_ext(_room, _sequence, _callback, _caller);
}

function flux_setup_room_ext(_room, _sequence, _callback = undefined, _caller = undefined, _speed = 1, _rot = 0, _destroy = true) {
	layer_set_target_room(_room);
	
	var _pos = __flux_get_camera_position(_sequence, view_camera[0])
	global.__flux_target_sequence = __flux_place_sequence(_sequence, _pos[0], _pos[1],  layer_get_id(FLUX_TRANSITION_LAYER));
	global.__flux_target_speed = _speed;
	global.__flux_target_rotation = _rot;
	
	// Setup Callback
	if(is_undefined(_caller)) _caller = self;
	global.__flux_target_callback = _callback;
	global.__flux_target_caller = _caller;
	
	// Setup Destruction
	global.__flux_target_destroy_complete = _destroy;
	
	// Reset Room Target
	layer_reset_target_room();
}