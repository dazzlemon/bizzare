extends Sprite#LeftHand

onready var main_hand = get_node("../hands")

func _process(delta):
	z_index = main_hand.z_index
	flip_v = bool(z_index)
	position.x *= pow(-1, int(flip_v == (position.x < 0)))
