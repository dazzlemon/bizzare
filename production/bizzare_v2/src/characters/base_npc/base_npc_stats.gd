#
class_name BaseNPCStats
extends BaseStats

signal damage_from_behind

onready var player_detection_zone = get_node("../control").playerDetectionZone


func set_health(value) -> void:
	health = value
	if health <= 0:
		emit_signal("no_health")
	if not player_detection_zone.has_player_inside_fov() :
		emit_signal("damage_from_behind")



