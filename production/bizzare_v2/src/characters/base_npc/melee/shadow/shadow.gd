class_name Shadow
extends BaseNPCMelee

func _ready():
	ACCEL = 300
	MAX_SPEED = 75
	DECEL = 200
	unit_type = Animations.new(1, 0)#"idle_run"
