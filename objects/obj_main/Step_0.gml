handle_fullscreen();

if (g.gfc % 60 == 0) {
	g.timeleft--;
}

if (instance_number(obj_target) < 1) {
	spawn_target();
}