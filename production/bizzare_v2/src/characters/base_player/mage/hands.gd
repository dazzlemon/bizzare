extends BaseHands

func _ready():
	rotation_degrees = -90
	._ready()


func set_rotation(value):
	flip_v = not bool(z_index)
	position.x *= pow(-1, int(flip_v == (position.x < 0)))
