class_name AttackRange
extends Area2D

var player = null
onready var parent = get_node("../")
onready var player_detection_zone = parent.get_node("player_detection_zone")

func _on_area_entered(area) -> void:
	player = area.get_node("../")
	if player_detection_zone.can_see_player() and parent.state != parent.States.DASH:
		parent.state = parent.States.ATTACK


func _on_area_exited(_area) -> void:
	parent.state = Utility.pick_random([parent.States.IDLE, parent.States.WANDER])
	player = null
