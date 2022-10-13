function __flux_event_handler(){
	var _head_pos = layer_sequence_get_headpos(global.__flux_sequence);
	
	var _event = global.__flux_events[$ _head_pos];
	if(!is_array(_event)) return;
	
	var _i = 0;
	var _count = array_length(_event);
	repeat(_count) {
		var _current = _event[_i];
		_current.callback(_current.caller, _current.args);
		_i++;
	}
}