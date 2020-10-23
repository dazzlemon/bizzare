extends BaseHands

func _ready():
	rotation_degrees = -90
	._ready()

func set_rotation(value):
	var flip_v_old = flip_v
	var rot_deg = fposmod(rad2deg(value), 360)
	flip_v = rot_deg < min_deg or rot_deg > max_deg
	position.x *= pow(-1, int(flip_v_old != flip_v))
