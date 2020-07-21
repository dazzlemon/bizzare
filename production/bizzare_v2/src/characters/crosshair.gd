extends Position2D

func _ready():
	global_position = Vector2.ZERO

func set_g_pos(position):
	self.global_position = position
