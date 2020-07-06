extends  KinematicBody2D

onready var stats = $Stats

func _on_hurtbox_area_entered(area):
	stats.health -= area.damage
	print("hp:" , stats.health)

func _on_Stats_no_heatlh():
	queue_free()
