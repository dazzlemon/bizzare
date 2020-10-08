class_name LeftHand
extends Sprite

onready var main_hand = get_node("../hands")

func _process(delta):
	z_index = main_hand.z_index
