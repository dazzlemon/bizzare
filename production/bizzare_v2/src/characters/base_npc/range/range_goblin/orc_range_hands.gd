class_name OrcRangeHands
extends BaseHands

func _update_z():
	return(Utility.map(._update_z(), 1, 2, 1, 4))

