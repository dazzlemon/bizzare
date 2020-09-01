class_name Consumable
extends KinematicBody2D

func _on_area_entered(area):
	die(area)
	queue_free()

func die(area):
	pass#area.use_consumable(self)
	
