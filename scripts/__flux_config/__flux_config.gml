// The Default Size of the Surface that will be created. 
// It is recommended that all transition sequences are equal to
// or greater than these values
#macro	FLUX_SURFACE_WIDTH			320
#macro	FLUX_SURFACE_HEIGHT			180

// The name of the layer that is used for sequences. 
// It is recommended that every room contains an "Asset" layer
// with the name of the value below
#macro	FLUX_LAYER					"seqTransitions"

// In order to prevent to many back to back transitions
// there is a buffer time where tick will not run. 
// A value of 1 is recommended for this. A higher value
// will cause a longer delay between when a transition can execute
#macro	FLUX_BUFFER_TIMER				1