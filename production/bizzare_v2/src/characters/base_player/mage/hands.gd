extends BaseHands

func _ready():
	rotation_degrees = -90
	._ready()

func set_rotation(value):
	flip_v = value <= -90 or value >= 90
