var _left = (keyboard_check(vk_left) || keyboard_check(ord("A")));
var _right = (keyboard_check(vk_right) || keyboard_check(ord("D")));
var _up = (keyboard_check(vk_up) || keyboard_check(ord("W")));
var _down = (keyboard_check(vk_down) || keyboard_check(ord("S")));

var _hv = 0;
var _vv = 0;
var _hi = 0;
var _vi = 0;

if (_left) { _hi--; }
if (_right) { _hi++; }
if (_up) { _vi--; }
if (_down) { _vi++; }

var _dir = point_direction(0, 0, _hi, _vi);

if (abs(_hi) + abs(_vi) > 0.5) {
	_hv = lengthdir_x(1, _dir);
	_vv = lengthdir_y(1, _dir);
}

var _spd = 1;

xv += (_hv * _spd);
yv += (_vv * _spd);

var _fric = 1.5;

xv /= _fric;
yv /= _fric;

x += xv;

if (tile_touching()) {
	x -= xv;
}

y += yv;

if (tile_touching()) {
	y -= yv;
}


if (xv > 0.5 && image_xscale < 0) { image_xscale = 1; }
if (xv < -0.5 && image_xscale > 0) { image_xscale = -1; }

if (abs(xv) + abs(yv) > 0.5 && sprite_index != spr_red_carpet_fly) {
	sprite_index = spr_red_carpet_fly;
	image_index = 0;
}

if (abs(xv) + abs(yv) < 0.25 && sprite_index == spr_red_carpet_fly) {
	sprite_index = spr_red_carpet_idle;
	image_index = 0;
}

if (sprite_index == spr_red_carpet_idle) {
	invis++;
	if (invis > 90) {
		sprite_index = spr_red_carpet_invis;
	}
} else {
	invis = 0;
}

if (sprite_index == spr_red_carpet_fly) {
	y_off++;
	y_off = clamp(y_off, -2, 8);
} else {
	y_off--;
	y_off = clamp(y_off, -2, 8);
}