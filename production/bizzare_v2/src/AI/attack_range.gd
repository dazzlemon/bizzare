class_name AttackRange
extends Area2D

#mb add static typing? + possibly need a rework to avoid using null reference



func _on_area_entered(area) -> void:
	if get_node("../player_detection_zone").can_see_player():
		get_node("../").state = get_node("../").States.ATTACK	


func _on_area_exited(_area) -> void:
	get_node("../").state = get_node("../").pick_random_state([get_node("../").States.IDLE, get_node("../").States.WANDER])
