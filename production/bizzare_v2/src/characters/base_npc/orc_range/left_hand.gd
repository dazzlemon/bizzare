class_name LeftHand
extends Sprite

onready var main_hand = get_node("../hands")
var max_val_z = 4

func _process(delta):
	z_index = Utility.map(main_hand.z_index, 1, max_val_z, 1, 3)
