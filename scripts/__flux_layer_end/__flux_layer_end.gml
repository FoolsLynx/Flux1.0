function __flux_layer_end(){
	if(!global.__flux_active) return;
	
	if(event_type == ev_draw) {
		if(event_number == 0) {
			surface_reset_target();		
		}
	}

}