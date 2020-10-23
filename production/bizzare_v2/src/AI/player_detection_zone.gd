# Class used for navigating enemy npc's
#
# if player is in this zone u can get theirs body
class_name PlayerDetectionZone
extends Area2D

var player = null#mb add static typing? + possibly need a rework to avoid using null reference
var fov_deg = 270

onready var look_at = $LookAt

func _on_area_entered(area: Area2D) -> void:
	player = area.owner


func _on_area_exited(_area: Area2D) -> void:
	player = null#mb need to check wheter area exited is player?
	get_node("../").state = get_node("../").States.IDLE


func can_see_player() -> bool:
	if has_player_inside_fov():
		look_at.cast_to = player.global_position - look_at.global_position
		if look_at.is_colliding():
			if look_at.get_collider() is BaseNPC:
				return true
			else:
				return false
		else:
			return true
		#return not (look_at.is_colliding() and look_at.get_collider() is BaseNPC)#to see trough NPC's
	return false


func has_player_inside_fov() -> bool:#player is inside this enemy instance fov
	return player != null and has_actual_player_inside_fov()


func has_actual_player_inside_fov() -> bool:
	return abs(look_at.cast_to.angle_to(player.global_position - global_position)) < deg2rad(fov_deg / 2)
	
	
func _on_stats_damage_from_behind() -> void:
	if player != null:#look at player
		look_at.cast_to = player.global_position - look_at.global_position
		if get_node("../attack_range").player != null:
			get_node("../").state = get_node("../").States.ATTACK
		else:
			get_node("../").state = get_node("../").States.CHASE
