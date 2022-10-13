function __flux_room_start(){
	global.__flux_layer = layer_get_id(FLUX_TRANSITION_LAYER);
	layer_script_begin(global.__flux_layer, __flux_layer_begin);
	layer_script_end(global.__flux_layer, __flux_layer_end);
	
	if(!is_undefined(global.__flux_target_sequence)) {
		if(!is_undefined(global.__flux_sequence)) {
			global.__flux_old_sequence = global.__flux_sequence;
			global.__flux_old_timer = 1;
		}
		global.__flux_sequence = global.__flux_target_sequence;
		
		if(!is_undefined(global.__flux_target_callback)) {
			global.__flux_callback = global.__flux_target_callback;
			global.__flux_caller = global.__flux_target_caller;
		}
		
		global.__flux_destroy_complete = global.__flux_target_destroy_complete;
		
		global.__flux_target_sequence = undefined;
		global.__flux_target_callback = undefined;
		global.__flux_target_caller = undefined;
		global.__flux_target_destroy_complete = true;
		
		
		global.__flux_active = true;
		
		surface_set_target(global.__flux_surface);
		draw_clear_alpha(c_black, 0.0);
		surface_reset_target();
	}
}