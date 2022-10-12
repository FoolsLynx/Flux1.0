/// @desc Transition Creation

// Run some code if Flux is Running
if(flux_running()) {
	// Check if flux sequence is finished
	if(flux_finished()) {
		// Destroy On Space
		if(keyboard_check_pressed(vk_space)) {
			flux_destroy(function() {
				flux_begin(seqFadeIn);
			});
		}
	}
}



// If the Transition is not running
if(!flux_running()) {
	// Check if Space is Pressed
	if(keyboard_check_pressed(vk_space)) {
		// Create some events that run at specific frames in sequence
		flux_add_event(10, function(_caller) {
			show_debug_message("Position 10");
		}, self);
		flux_add_event(20, function(_caller) {
			show_debug_message("Position 20");
		}, self);
		flux_add_event(20, function(_caller) {
			show_debug_message("Duplicate");
		}, self);
		// Create our Transition that will Fade Out
		flux_begin_ext(seqFadeOut, false);
	}
}