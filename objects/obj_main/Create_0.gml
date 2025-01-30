#macro o other
#macro g global

g.gfc = 0;

g.desktop = (os_browser == browser_not_a_browser);

surface_resize(application_surface, 320, 180);
window_set_size(320, 180);
display_reset(0, true);

exception_unhandled_handler(error);
draw_set_circle_precision(64);

g.vol = 0.75;
audio_master_gain(g.vol);

//audio_play_sound(mus_game, 1, true, 0.75);

g.deliveries = 0;
g.timeleft = 61;
g.location = "";

randomize();