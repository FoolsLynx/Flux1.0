function flux_set_view(_view){
	if(_view == undefined) {
		_view = view_camera[0];	
	}
	global.__flux_view = _view;
}