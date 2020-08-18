class_name AttackRange
extends Area2D

onready var parent = get_node("../")

func _on_area_entered(_area) -> void:
	if parent.get_node("player_detection_zone").can_see_player() and parent.state != parent.States.DASH:
		parent.state = parent.States.ATTACK	


func _on_area_exited(_area) -> void:
	parent.state = parent.pick_random_state([parent.States.IDLE, parent.States.WANDER])
