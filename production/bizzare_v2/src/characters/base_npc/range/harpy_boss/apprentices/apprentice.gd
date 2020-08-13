class_name Apprentice
extends BaseNPCRange

func _process(delta):
	position = position.rotated(delta)

func drop_loot():
	pass
