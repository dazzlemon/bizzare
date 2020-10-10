extends Area2D

var status := false
onready var delay = get_node("delay")

func _on_area_entered(_area) -> void:
	delay.start(0.75)
	status = true

func _on_area_exited(_area) -> void:
	delay.start(0.75)
	status = false


func _on_delay_timeout() -> void:
	get_node("../../pivot/sprite").visible = status
	get_node("../../StatusBar/statusBar").visible = status
	get_node("../../pivot/shadow").visible = status
	get_node("../../pivot/hands").visible = status
	get_node("../../pivot/left_hand").visible = status
