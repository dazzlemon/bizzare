extends Sprite

var rotation_limit = 29

func _process(delta):
	rotation += get_angle_to(get_owner().crosshair.global_position)
	z_index = 1 + int(fposmod(rotation_degrees, 360) < 180  + rotation_limit or fposmod(rotation_degrees, 360) > 360 - rotation_limit)
