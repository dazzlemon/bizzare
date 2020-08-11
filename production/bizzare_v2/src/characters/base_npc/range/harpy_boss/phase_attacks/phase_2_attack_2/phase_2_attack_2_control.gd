class_name Phase2Attack2Control
extends Node

func start():
	var target = get_node("../../../player").global_position - get_node("../../").global_position
	get_node("RayCast2D").cast_to = target
	if not get_node("RayCast2D").is_colliding():
		get_node("../").state = get_node("../").States.DASH
		get_node("../").dash_target = target
		
