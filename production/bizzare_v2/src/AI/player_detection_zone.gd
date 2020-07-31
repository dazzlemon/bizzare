# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name PlayerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference

onready var look_at = $LookAt
var fov_deg = 270

func _on_area_entered(area) -> void:
	player = area.get_node("../")


func _on_area_exited(_area) -> void:
	player = null#mb need to check wheter area exited is player?
	
	
func can_see_player() -> bool:#rework to return false if raycast collides(add raycast)
	if player == null:
		return false
	else:
		var is_player_inside_fov = has_player_inside_fov()
		if not is_player_inside_fov:
			return false
		look_at.set_cast_to(player.global_position - look_at.global_position)
		var is_look_at_intersecting = look_at.is_colliding() and not look_at.get_collider() is BaseNPC
		return not is_look_at_intersecting and is_player_inside_fov


func has_player_inside_fov() -> bool:#player is inside this enemy instance fov
	if player == null:
		return false
	var vec_self_to_player = player.global_position - global_position
	var vec_self_to_look_at = look_at.cast_to
	var angle_look_at_to_player = vec_self_to_look_at.angle_to(vec_self_to_player)
	return angle_look_at_to_player < deg2rad(fov / 2) and angle_look_at_to_player > deg2rad(-fov / 2)
