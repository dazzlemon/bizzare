#WIP
class_name KnightAOE
extends BaseHitscan

var KNOCKBACK_MULTIPLIER := 225

func _ready() -> void:
	_DURATION = 0.15
	_INTERVAL = 5


func get_damage():
	return .get_damage() * 2.5


func knockback(body) -> Vector2:# WIP
	var direction = (body.global_position - get_node("../").global_position).normalized()
	return direction * KNOCKBACK_MULTIPLIER
