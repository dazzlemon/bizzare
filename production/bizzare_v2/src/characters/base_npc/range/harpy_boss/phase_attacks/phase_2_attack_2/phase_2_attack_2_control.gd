class_name Phase2Attack2Control
extends PhaseAttacks

onready var get_parent = get_node("../")

func _ready():
	_DURATION = 9
	_WAVE_INTERVAL = 3


func _start():
	dash()


func dash():
	var control = get_node("../")
	var target = get_node("../../../player").global_position
	var ray = get_node("RayCast2D")
	ray.cast_to = target - global_position
	if not ray.is_colliding():
		get_node("../../").state = get_node("../../").States.NO_FRICTION
		control.dash_target = target
		control.dash_start = global_position
		control.state = control.States.DASH


func _stop():
	get_parent.phase_attack_ended()
