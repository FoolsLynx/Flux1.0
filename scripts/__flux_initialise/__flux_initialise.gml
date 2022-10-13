#macro	FLUX_VERSION	"1.1.0"

__flux_initialise();

function __flux_initialise(){
	// Only fun once
	if(variable_global_exists("__flux_init")) return false;
	// Setup Phase
	global.__flux_init = "starting";
	
	// Create Time Source
	try {
		global.__flux_time_source = time_source_create(time_source_global, 1, time_source_units_frames, function() {
			__flux_tick();
		}, [], -1);
		time_source_start(global.__flux_time_source);
	} catch(e) {
		try {
			global.__flux_time_source = time_source_create(time_source_global, 1, time_source_units_frames, function() {
				__flux_tick();
			}, -1);
			time_source_start(global.__flux_time_source);
		} catch(e) {
			__flux_trace("Could not create the \"Flux Time Source\". Flux requires GM2020.5 or later.", true);
		}
	}
	
	// Begin Variable Phase
	global.__flux_init = "variables";
	
	// Sequence that Flux will be trying to play
	global.__flux_sequence = undefined;
	
	// Layer that Flux Sequences are placed on
	global.__flux_layer = -1;
	
	// Surface that Flux draws to
	global.__flux_surface = undefined;
	__flux_create_surface();
	
	// Create Flux Object
	global.__flux_object = noone;
	
	// Flux State
	global.__flux_active = false;
	
	// Flux Callbacks
	global.__flux_callback = undefined;
	global.__flux_caller = undefined;
	
	// Flux Events
	global.__flux_events = {};
	
	// Target Rooms
	global.__flux_target_sequence = undefined;
	global.__flux_target_callback = undefined;
	global.__flux_target_caller = undefined;
	global.__flux_target_destroy_complete = true;
	
	// Garbage Collection
	global.__flux_destroy_complete = true;
	global.__flux_old_sequence = undefined;
	global.__flux_old_timer = 0;
	
	// Finish Flux
	global.__flux_init = "completed";
	
	return true;
}