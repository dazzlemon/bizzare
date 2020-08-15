class_name Phase2Attack2Control
extends Node2D



func start():
	var control = get_node("../")
	var target = get_node("../../../player").global_position
	var ray = get_node("RayCast2D")
	ray.cast_to = target - global_position
	if not ray.is_colliding():
		get_node("../../").state = get_node("../../").States.NO_FRICTION
		control.dash_target = target
		control.dash_start = global_position
		control.state = control.States.DASH

