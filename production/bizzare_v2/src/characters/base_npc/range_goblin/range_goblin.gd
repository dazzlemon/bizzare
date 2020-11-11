class_name RangeGoblin
extends BaseNPC

func _ready():
	ACCEL = 300
	MAX_SPEED = 75
	DECEL = 200
	unit_type = Animations.new(1, 1)#"idle_run"
