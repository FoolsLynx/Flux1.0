function __flux_get_camera_position(_sequence, _view = undefined){
	var _seq = sequence_get(_sequence);
	var _ox = _seq.xorigin;
	var _oy = _seq.yorigin;
	
	if(is_undefined(_view)) {
		_view = global.__flux_view;	
	}
	
	var _cam_x = camera_get_view_x(_view);
	var _cam_y = camera_get_view_y(_view);
	
	var _cam_hw = camera_get_view_width(_view) * 0.5;
	var _cam_hh = camera_get_view_height(_view) * 0.5;
	
	var _sx = (_cam_x + _cam_hw) + _ox;
	var _sy = (_cam_y + _cam_hh) + _oy;
	
	return [_sx, _sy]
}