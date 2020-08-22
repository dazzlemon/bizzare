# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name PlayerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference
var fov_deg = 270

onready var look_at = $LookAt

func _on_area_entered(area: Area2D) -> void:
	player = area.get_node("../")


func _on_area_exited(_area: Area2D) -> void:
	player = null#mb need to check wheter area exited is player?


func can_see_player() -> bool:
	if has_player_inside_fov() and player != null:
		look_at.cast_to = player.global_position - look_at.global_position
		return not (look_at.is_colliding() and look_at.get_collider() is BaseNPC)#to see trough NPC's
	return false


func has_player_inside_fov() -> bool:#player is inside this enemy instance fov
	return player != null and has_actual_player_inside_fov()


func has_actual_player_inside_fov() -> bool:
	return abs(look_at.cast_to.angle_to(player.global_position - global_position)) < deg2rad(fov_deg / 2)
	
	
func _on_stats_damage_from_behind() -> void:
	if player != null:#look at player
		look_at.set_cast_to(player.global_position - look_at.global_position)
