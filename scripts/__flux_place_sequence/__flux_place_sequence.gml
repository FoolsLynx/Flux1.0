function __flux_place_sequence(_sequence, _x, _y, _layer = undefined){
	if(_layer == undefined) _layer = global.__flux_layer;
	return layer_sequence_create(_layer, _x, _y, _sequence);
}