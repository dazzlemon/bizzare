# basic hitscan attack
class_name BaseHitscan
extends SpellCdDuration

onready var hitbox_collision = get_node("Position2D/hitbox/CollisionShape2D")#mb fix later

var damage: float = 1

func _ready() -> void:
	_DURATION = 0.25
	_INTERVAL = 0.15


func _start() -> void:
	hitbox_collision.disabled = false


func _stop() -> void:
	hitbox_collision.disabled = true
