///------------------------------------------------------------------
/// Flux Layer End
///------------------------------------------------------------------
/// This script contains the code that will ensure that the 
/// surface is reset and that only assets on the transition layer
/// are drawn to the surface.
///------------------------------------------------------------------

function __flux_layer_end() {
	if(!global.__flux_active || is_undefined(global.__flux_surface)) return;
	// Only Execute in the Draw Event
	if(event_type == ev_draw) {
		if(event_number == 0) {
			// Reset the Target
			surface_reset_target();
			
		}
	}
}