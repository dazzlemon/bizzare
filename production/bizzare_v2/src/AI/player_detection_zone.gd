# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name PlayerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference

func _on_area_entered(area) -> void:
	player = area.get_node("../")


func _on_area_exited(_area) -> void:
	player = null#mb need to check wheter area exited is player?
	
	
func can_see_player() -> bool:#rework to return false if raycast collides(add raycast)
	if player == null:
		return false
	else:
		var look_at = get_node("LookAt")
		look_at.set_cast_to(player.global_position - look_at.global_position)
		if look_at.is_colliding():#GOVNO FIX NEED FIX ASAP # RAZRABI USHLI V VALORANT
			return  look_at.get_collider() is Goblin
		return true
				
