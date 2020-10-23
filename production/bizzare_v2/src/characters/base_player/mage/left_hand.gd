extends LeftHand

func _ready():
	max_val_z = 2

func _process(delta):
	z_index = Utility.map(main_hand.z_index, 1, max_val_z, 1, 3)
