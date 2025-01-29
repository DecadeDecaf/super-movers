draw_set_font(fnt_regular);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

var _white = #fff4e0;
var _black = #2c1b2e;

draw_set_color(_black);
draw_text(9, 177, g.location);
draw_text(9, 176, g.location);
draw_text(10, 177, g.location);

draw_set_color(_white);
draw_text(10, 176, g.location);