# basic hitscan attack
class_name BaseHitscan
extends SpellCdDuration

onready var hitbox_collision = get_node("Position2D/hitbox/CollisionShape2D")#mb fix later
onready var stats = get_node("../stats")

func _ready() -> void:
	_DURATION = 0.25
	_INTERVAL = 0.15


func get_damage():
	return stats.damage


func _start() -> void:
	if get_node("../Sound/attack"):
		get_node("../Sound/attack").playing = true
	hitbox_collision.disabled = false


func _stop() -> void:
	hitbox_collision.disabled = true
