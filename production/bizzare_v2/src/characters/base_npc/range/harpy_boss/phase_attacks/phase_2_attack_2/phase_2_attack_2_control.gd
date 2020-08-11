class_name Phase2Attack2Control
extends Node2D

func start():
	var control = get_node("../")
	var target = get_node("../../../player").global_position
	var ray = get_node("RayCast2D")
	ray.cast_to = target - global_position
	if not ray.is_colliding():
		control.dash_target = target
		control.dash_start = global_position
		control.state = control.States.DASH
	# atm its the most gay fix ever(dont try at home), even gay fix doesnt work because everything is clutterfuck(gg)
	# it speeds up realy slow + slows down slow too
	#
	# dont aggro through walls(RayCast2D may work but seems gay)
	# stop in target(atm it fluctuates around, slowing)
