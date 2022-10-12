function flux_add_event(_pos, _callback, _caller) {
	var _value = global.__flux_events[$ _pos];
	if(_value == undefined) {
		global.__flux_events[$ _pos] = [];
	}
	
	array_push(global.__flux_events[$ _pos], {
		callback : _callback,
		caller : _caller
	});
}