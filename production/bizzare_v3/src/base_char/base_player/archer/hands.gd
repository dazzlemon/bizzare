extends BaseHands


func set_rotation(value):
	if get_global_mouse_position().x < get_node("../../").global_position.x:
		flip_v = true
	else:
		flip_v = false
	#flip_h = bool(z_index)
	position.x *= pow(-1, int(flip_h == (position.x < 0)))
	.set_rotation(value)
