///-------------------------------------
/// Flux Running
///-------------------------------------
/// Returns true or false depending on if the 
/// transition system is active
///--------------------------------------

function flux_running(){
	return global.__flux_active && !is_undefined(global.__flux_sequence);
}