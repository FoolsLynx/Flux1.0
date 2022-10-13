function flux_setup_callback(_callback, _caller){
	if(is_undefined(_caller)) _caller = self;
	global.__flux_callback = _callback;
	global.__flux_caller = _caller;
}