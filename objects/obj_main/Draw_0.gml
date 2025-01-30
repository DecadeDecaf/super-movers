var _dx = 0;
var _dy = 0;

with (obj_camera) {
	_dx = x - 160;
	_dy = y - 90;
}

draw_set_font(fnt_regular);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var _white = #fff4e0;
var _black = #2c1b2e;

draw_set_color(_black);
draw_text(_dx + 9, _dy + 177, g.location);
draw_text(_dx + 9, _dy + 176, g.location);
draw_text(_dx + 10, _dy + 177, g.location);

draw_set_color(_white);
draw_text(_dx + 10, _dy + 176, g.location);

var _point = 0;

with (obj_player) {
	var _target = instance_nearest(x, y, obj_target);
	if (instance_exists(_target)) {
		_point = point_direction(x, y, _target.x, _target.y);
	}
}

gpu_set_fog(true, _black, 1, 1);
draw_sprite(spr_compass, 0, _dx + 24, _dy + 142);
draw_sprite(spr_compass, 0, _dx + 25, _dy + 143);
draw_sprite(spr_compass, 0, _dx + 24, _dy + 143);
draw_sprite_ext(spr_compass, 1, _dx + 24, _dy + 142, 1, 1, _point, -1, 1);
draw_sprite_ext(spr_compass, 1, _dx + 25, _dy + 143, 1, 1, _point, -1, 1);
draw_sprite_ext(spr_compass, 1, _dx + 24, _dy + 143, 1, 1, _point, -1, 1);

gpu_set_fog(false, -1, 0, 0);
draw_sprite(spr_compass, 0, _dx + 25, _dy + 142);
draw_sprite_ext(spr_compass, 1, _dx + 25, _dy + 142, 1, 1, _point, -1, 1);

var _time = string(g.timeleft);
draw_set_halign(fa_right);

draw_set_color(_black);
draw_text(_dx + 309, _dy + 177, _time);
draw_text(_dx + 309, _dy + 176, _time);
draw_text(_dx + 310, _dy + 177, _time);

draw_set_color(_white);
draw_text(_dx + 310, _dy + 176, _time);