function tile_touching() {
	var _lay = layer_get_id("tiles");
	var _map = layer_tilemap_get_id(_lay);
	var _tile = tilemap_get_at_pixel(_map, x, y);
	var _bbox_w = 8;
	var _bbox_h = 4;
	var _tile_tl = tilemap_get_at_pixel(_map, x - _bbox_w, y - _bbox_h);
	var _tile_tr = tilemap_get_at_pixel(_map, x + _bbox_w, y - _bbox_h);
	var _tile_bl = tilemap_get_at_pixel(_map, x - _bbox_w, y + _bbox_h);
	var _tile_br = tilemap_get_at_pixel(_map, x + _bbox_w, y + _bbox_h);
	var _active = [16, 32, 48, 64, 80, 96];
	var _touching = false;
	if (_tile_tl > 96 || array_has(_active, _tile_tl)) { _touching = true; }
	if (_tile_tr > 96 || array_has(_active, _tile_tr)) { _touching = true; }
	if (_tile_bl > 96 || array_has(_active, _tile_bl)) { _touching = true; }
	if (_tile_br > 96 || array_has(_active, _tile_br)) { _touching = true; }
	if (x < _bbox_w || x > room_width - _bbox_w) { _touching = true; }
	if (y < _bbox_h || y > room_height - _bbox_h) { _touching = true; }
	return _touching;
}