extends Sprite


func _process(delta):
	rotation += get_angle_to(get_owner().crosshair.global_position)
	if rotation < -360:
		rotation += 360
	if rotation > 360:
		rotation -= 360
	if rotation >= 0 and rotation <= 90 or rotation > -360 and rotation <= 270:
		z_index = 2
		#flip_h = false
	elif rotation > 90 and rotation <= 180 or rotation > -270 and rotation<= -180:
		z_index = 2
		#flip_h = true
	elif rotation > 180 and rotation <= 270 or rotation > -180 and rotation <= -90:
		z_index = 1
		#flip_h = true
	elif rotation > 270 and rotation <= 360 or rotation > -90 and rotation < 0:
		z_index = 1
		#flip_h = false
