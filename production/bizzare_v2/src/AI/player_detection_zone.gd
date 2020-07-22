# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name PlayerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference

func _on_body_entered(body) -> void:
	player = body


func _on_body_exited(_body) -> void:
	player = null
	
	
func can_see_player() -> bool:#rework to return false if raycast collides(add raycast)
	if player == null:
		return false
	else:
		var look_at = get_node("LookAt")
		look_at.set_cast_to(player.global_position - look_at.global_position)
		return not look_at.is_colliding()
