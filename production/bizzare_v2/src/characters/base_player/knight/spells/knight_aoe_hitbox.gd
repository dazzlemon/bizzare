#WIP
class_name KnightAOEHitbox
extends BaseHitscanHitbox

var KNOCKBACK_MULTIPLIER := 225

func _ready() -> void:
	damage = get_node("../../../stats").damage * 2.5
	

func knockback(body) -> Vector2:# WIP
	var direction = (body.global_position - get_node("../").global_position).normalized()
	return direction * KNOCKBACK_MULTIPLIER
