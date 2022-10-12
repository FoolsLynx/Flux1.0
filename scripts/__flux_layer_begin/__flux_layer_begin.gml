///------------------------------------------------------------------
/// Flux Layer Begin
///------------------------------------------------------------------
/// This script contains the code that is required to ensure that
/// any sequences drawn will be drawn to the transition surface
/// rather than any other surface that has been set
///------------------------------------------------------------------

function __flux_layer_begin() {
	if(!global.__flux_active || is_undefined(global.__flux_surface)) return;
	
	// Only Execute in the Draw Event
	if(event_type == ev_draw) {
		if(event_number == 0) {
			// Set Target to our transition surface
			surface_set_target(global.__flux_surface);
			
			// Clear the Surface
			draw_clear_alpha(c_black, 0);
		}
	}
}