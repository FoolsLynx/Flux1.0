/// @desc Transition Creation

// If the Transition is not running
if(!flux_running()) {
	// Check if Space is Pressed
	if(keyboard_check_pressed(vk_space)) {
		// Create our Transition that will Fade Out
		flux_begin(seqFadeOut, function() {
			// Create our Transition that will Fade In
			// Called AFTER the Fade Out transition is completed
			flux_begin(seqFadeIn);
		});
	}
}