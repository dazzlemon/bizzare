class_name OrcRangeHands
extends BaseHands

func _update_z(rot_deg):
	._update_z(rot_deg)
	return(Utility.map(z_index, 1, 2, 1, 4))

