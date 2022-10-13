function __flux_draw(){
	if(!global.__flux_active) return;
	
	if(surface_exists(global.__flux_surface)) {
		if(debug_mode) {
			surface_set_target(global.__flux_surface);
			draw_text(0, 0, "Flux 1.1.0");
			surface_reset_target();
		}
		draw_surface(global.__flux_surface, 0, 0);	
	}
}