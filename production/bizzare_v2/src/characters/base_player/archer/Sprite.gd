extends Sprite



func _process(delta):
	rotation_degrees += get_angle_to(get_owner().crosshair.global_position)
	#z_index = int(fposmod(rotation_degrees, 360)/180) + 1
	var rotation_posmod = fposmod(rotation_degrees, 360)
	if rotation_posmod < 180:
		z_index = 2
	else:
		z_index = 1
