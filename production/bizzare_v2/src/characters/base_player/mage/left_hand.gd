#extends LeftHand
extends Sprite

onready var main_hand = get_node("../hands")

func _process(delta):
	z_index = Utility.map(main_hand.z_index, 1, 2, 1, 3)
