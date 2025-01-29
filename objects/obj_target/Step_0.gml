if (image_index == 1) {
	lifespan--;
	if (lifespan <= 0) {
		instance_destroy();
	}
}