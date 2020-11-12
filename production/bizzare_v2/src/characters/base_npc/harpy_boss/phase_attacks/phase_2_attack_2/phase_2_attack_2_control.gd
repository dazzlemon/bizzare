class_name Phase2Attack2Control
extends PhaseAttacks

onready var control = get_node("../")
onready var ray = get_node("RayCast2D")
onready var double_up = get_node("../../")

func _ready():
	_DURATION = 9
	_WAVE_INTERVAL = 3


func _start():
	dash()


func dash():
	var target = get_node("../../../player").global_position
	ray.cast_to = target - global_position
	if not ray.is_colliding():
		double_up.state = double_up.States.NO_FRICTION
		control.dash_target = target
		control.dash_start = global_position#mb redundant
		control.state = control.States.DASH


func _stop():
	control.phase_attack_ended()
