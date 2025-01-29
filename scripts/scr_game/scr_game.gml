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

function spawn_target() {
	var _spawns = [
		["Town Hall", 984, 464],
		["Town Hall (Back Entrance)", 1040, 304],
		["Fire Department", 768, 72],
		["Supermarket", 1152, 672],
		["Supermarket Lot", 1096, 880],
		["Supermarket Lot", 1208, 880],
		["Mulch Factory", 816, 840],
		["Mulch Factory (Yard)", 952, 752],
		["Suburbia", 56, 96],
		["Suburbia", 152, 96],
		["Suburbia", 248, 96],
		["Suburbia", 344, 96],
		["Suburbia", 440, 96],
		["Downtown", 1528, 488],
		["Parking Lot", 80, 680],
		["Parking Lot", 320, 680],
		["Water Treatment", 344, 448],
		["Central Park", 728, 584],
		["Highway Park", 1336, 56],
		["Picnic Park", 40, 328],
		["Downtown Park", 1472, 576],
		["Downtown Ditch", 1440, 328],
		["Recreation Park", 160, 776],
		["Recreation Park", 256, 776],
		["Hero Burger", 920, 128],
		["Courthouse", 616, 128],
		["The Intersection", 1336, 488],
		["Southbound Bridge", 1336, 800],
		["Main St.", 640, 488],
		["Main St.", 1176, 488]
	];
	var _len = array_length(_spawns);
	var _rand = irandom_range(0, _len - 1);
	var _spawn = _spawns[@ _rand];
	var _spawn_x = _spawn[@ 1];
	var _spawn_y = _spawn[@ 2];
	with (obj_player) {
		while (point_distance(x, y, _spawn_x, _spawn_y) < 256) {
			_rand = irandom_range(0, _len - 1);
			_spawn = _spawns[@ _rand];
			_spawn_x = _spawn[@ 1];
			_spawn_y = _spawn[@ 2];
		}
	}
	instance_create_depth(_spawn_x, _spawn_y, 5, obj_target);
	g.location = _spawn[@ 0];
}