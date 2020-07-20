extends "res://characters/base_char.gd"

func _ready():
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200

func die():
	.die()
	#drop_loot()
