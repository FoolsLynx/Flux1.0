///------------------------------------------------------------------
/// Flux Begin
///------------------------------------------------------------------
/// This is a basic script that will create a sequence and prepare
/// it for our system
/// 
/// Paramters:
///		_seq:		Sequence Asset
///		_callback:	Function to execute after transition is finished
///		_caller:	The object or script that called the function
///
/// Sequence: (Required)
///		The Sequence Asset that will play as the transition
///
/// Callback: (Optional)
///		After the sequence has finished, you can execute code that
///		will be called. Callback takes in the caller which will 
///		allow for changing variables and executing other scripts
///		within the caller
///
///	Caller: (Optional)
///		The Caller is the object / constructor that called this
///		script. By default the caller will be whatever self is.
///
///------------------------------------------------------------------
/// @param sequence
/// @param [callback]
/// @param [caller]
///------------------------------------------------------------------

function flux_begin(_seq, _callback = undefined, _caller = undefined) {
	// Get X and Y position from View
	var _x = camera_get_view_x(global.__flux_view) + floor(camera_get_view_width(global.__flux_view) * 0.5);
	var _y = camera_get_view_y(global.__flux_view) + floor(camera_get_view_height(global.__flux_view) * 0.5);
	
	// Create the Sequence
	global.__flux_sequence = layer_sequence_create(global.__flux_layer, _x, _y, _seq);	
	
	// Setup Callbacks
	if(!is_undefined(_callback)) {
		global.__flux_callback = _callback;
		global.__flux_callback_caller = is_undefined(_caller) ? self : _caller;
	} else {
		global.__flux_callback = undefined;
		global.__flux_caller = undefined;
	}
	
	// Set Transition State
	global.__flux_active = true;
	
	// Set Flux Phase
	global.__flux_phase = "running";
}
