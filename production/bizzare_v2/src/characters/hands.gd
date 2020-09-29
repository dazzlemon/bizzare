extends Sprite

func _process(delta):
	rotation_degrees += get_angle_to(get_owner().crosshair.global_position)
	z_index = 2 - int(fposmod(rotation_degrees, 360)/180)
