function flux_setup_event(_pos, _callback, _caller = undefined, _args = []){
	var _value = global.__flux_events[$ _pos];
	if(!is_array(_value)) {
		global.__flux_events[$ _pos] = [];	
	}
	
	if(_caller == undefined) _caller = self;
	
	array_push(global.__flux_events[$ _pos], {
		callback : _callback,
		caller : _caller,
		args : _args
	});
}