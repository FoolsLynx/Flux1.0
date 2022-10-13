if(!global.__flux_active) {
	if(keyboard_check_pressed(vk_space)) {
		flux_setup_room_ext(Room2, seqBlobInLeft,,,2);
		flux_setup_event(4, function() {
			show_debug_message("Does this call at speed * 2?");	
		});
		flux_start_ext(seqBlobOutLeft, function() {
			room_goto(Room2);
		}, self, 2);
	}
}