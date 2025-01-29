var _draw = true;

if (image_index == 1) {
	_draw = (lifespan % 10 >= 5);
}

if (_draw) {
	draw_self();
}