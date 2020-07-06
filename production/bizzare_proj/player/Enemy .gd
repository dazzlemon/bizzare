extends Node2D

func _on_hurtbox_area_entered(area):
	queue_free()
