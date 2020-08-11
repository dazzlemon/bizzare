class_name Apprentice
extends BaseNPCRange

func _process(delta):
	rotation += delta * deg2rad(5)
