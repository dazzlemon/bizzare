#
class_name Goblin
extends BaseNPCMelee

func _ready():
	ACCEL = 300
	MAX_SPEED = 100
	DECEL = 200
	unit_type = Animations.new(1, 1)#"idle_run"

