# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name playerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference

func _on_body_entered(body) -> void:
	player = body


func _on_body_exited(_body) -> void:
	player = null
	
	
func can_see_player() -> bool:
	return player != null
