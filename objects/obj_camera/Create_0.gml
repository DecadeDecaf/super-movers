x = 0;
y = 0;

lookx = 0;
looky = 0;

with (obj_player) {
	o.x = x;
	o.y = y;
	o.lookx = x;
	o.looky = y;
}

camera = camera_create();
zw = 320;
zh = 180;

camera_set_view_size(camera, zw, zh);

var _vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var _pm = matrix_build_projection_ortho(zw, zh, -10000, 10000);

camera_set_view_mat(camera, _vm);
camera_set_proj_mat(camera, _pm);

view_camera[0] = camera;