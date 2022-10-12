///------------------------------------------------------------------
/// Flux Initialise
///------------------------------------------------------------------
/// This script will run upon the game being executed. 
/// The script will set the default values needed to make the 
/// transition system run.
///
/// Unless you know what you are doing, DO NOT mess around
/// with this script as it may end up causing errors.
///------------------------------------------------------------------

__flux_initialise();

function __flux_initialise(){
	// Only Run Once
	if(variable_global_exists("__flux_init")) return false;
	
	// Initialise Transition Setup
	global.__flux_init = "pending";
	
	// Create the Time Source for Updating
	try {
		global.__flux_time_source = time_source_create(time_source_global, 1, time_source_units_frames, function() {
			__flux_tick();	
		}, [], -1);
		time_source_start(global.__flux_time_source);
	} catch(e) {
		show_error(e.longMessage, true);	
	}
	
	// Setup Variable
	global.__flux_sequence = undefined;
	global.__flux_layer = -1;
	
	global.__flux_buffer_timer = FLUX_BUFFER_TIMER;
	
	global.__flux_destroy_done = true;
	global.__flux_old = undefined;
	global.__flux_old_timer = 0;
	
	global.__flux_active = false;
	global.__flux_surface = undefined;
	
	global.__flux_current_room = room;
	global.__flux_view = view_camera[0];
	
	global.__flux_callback = undefined;
	global.__flux_callback_caller = undefined;
	
	global.__flux_events = {};
	
	global.__flux_phase = "start";
	
	
	// Create our surface
	global.__flux_surface = surface_create(FLUX_SURFACE_WIDTH, FLUX_SURFACE_HEIGHT);
	
	// Complete Transition Setup
	global.__flux_init = "completed";
	
	// Completed
	return true;
}