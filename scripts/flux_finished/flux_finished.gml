///-----------------------------------------------------------
/// Flux Finished
///-----------------------------------------------------------
/// Checks to see if the Flux sequence has finished. 
///-----------------------------------------------------------

function flux_finished(){
	return layer_sequence_is_finished(global.__flux_sequence)
}