extends Sprite



func _process(delta):
	rotation += get_angle_to(get_owner().crosshair.global_position)
