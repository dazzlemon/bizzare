class_name Apprentice
extends BaseNPCRange

func _process(delta):
	position = position.rotated(delta)
