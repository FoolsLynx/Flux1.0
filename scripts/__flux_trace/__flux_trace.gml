function __flux_trace(_message, _abort = true){
	var _version = "Flux " + FLUX_VERSION;
	var _phase = "Flux Phase: " + global.__flux_init;
	var _full_message = _version + "\n" + _phase + "\n\n" + _message;
	
	show_error(_full_message, _abort);	
}