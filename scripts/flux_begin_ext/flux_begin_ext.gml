function flux_begin_ext(_seq, _destroy = true, _callback = undefined, _caller = undefined){
	global.__flux_destroy_done = _destroy;
	flux_begin(_seq, _callback, _caller);
}