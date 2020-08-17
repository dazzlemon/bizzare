extends Area2D

var status := false

func _on_area_entered(_area) -> void:
	get_node("delay").start(0.75)
	status = true
	#get_node("../../pivot/sprite").visible = !get_node("../../pivot/sprite").visible

func _on_area_exited(_area) -> void:
	get_node("delay").start(0.75)
	status = false
	#get_node("../../pivot/sprite").visible = !get_node("../../pivot/sprite").visible

func _on_delay_timeout():
	get_node("../../pivot/sprite").visible = status
