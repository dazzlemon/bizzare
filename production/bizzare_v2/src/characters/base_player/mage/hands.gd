extends BaseHands

func _ready():
	rotation_degrees = -90
	._ready()

func set_rotation(value):
	flip_v = bool(Utility.map(z_index, 1, 2, 0, 1))
	position.x *= pow(-1, int(flip_v == (position.x < 0)))
	
