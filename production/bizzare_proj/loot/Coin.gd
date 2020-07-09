extends KinematicBody2D

func _on_hurtbox_area_entered(_area):
	queue_free()
