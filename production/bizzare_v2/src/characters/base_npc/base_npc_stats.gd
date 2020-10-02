#
class_name BaseNPCStats
extends BaseStats

signal damage_from_behind

onready var player_detection_zone = get_node("../control").player_detection_zone

func _ready():
	._ready()
	
	
func health_set(value) -> void:
	.health_set(value)
	if not player_detection_zone.has_player_inside_fov():
		emit_signal("damage_from_behind")####FIX FOR ENEMIES who can heal
