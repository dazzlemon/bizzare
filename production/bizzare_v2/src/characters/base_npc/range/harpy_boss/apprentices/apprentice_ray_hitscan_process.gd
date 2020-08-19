extends RayHitscanProcess

func _process(delta):
	._process(delta)
	cast_to = crosshair.global_position - double_up.global_position
