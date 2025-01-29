draw_sprite_ext(spr_shadow, 0, x, y, 1, 1, 0, -1, 0.5);

var _alph = 1;
if (invis > 80) { _alph = (1 - clamp(((invis - 80) / 10), 0, 1)); }

var _xx = x + median(y_off * image_xscale, 0, 2 * image_xscale);
var _yy = y - clamp(y_off, 0, 4);
draw_sprite_ext(sprite_index, image_index, _xx, _yy, image_xscale, 1, 0, -1, _alph);

if (invis > 80) {
	draw_sprite_ext(spr_red_carpet_invis, image_index, x, y, image_xscale, 1, 0, -1, 1);
}