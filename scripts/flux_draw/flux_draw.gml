///------------------------------------------------------------------
/// Flux Draw
///------------------------------------------------------------------
/// This script contains the code that will draw the surface to the
/// screen. 
///
/// This script should be called in Draw GUI End after everything
/// else has been drawn. 
/// 
/// Depending on the way you have your game setup, you may need to
/// make sure that any other surfaces drawn in Draw GUI End are
/// executed BEFORE executing this code.
///------------------------------------------------------------------

function flux_draw() {
	// Do not draw if transition is not active or if there is no surface
	if(!global.__flux_active || is_undefined(global.__flux_surface)) return;
	
	// Draw our transition surface
	draw_surface(global.__flux_surface, 0, 0);
}