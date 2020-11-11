class_name OrcRangeHands
extends BaseHands

func _update_z(rot_deg):
	._update_z(rot_deg)
	z_index = (Utility.map(z_index, 1, 2, 1, 4))

