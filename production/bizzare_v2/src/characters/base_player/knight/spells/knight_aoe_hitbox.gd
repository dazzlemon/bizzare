#WIP
class_name KnightAOEHitbox
extends BaseHitscanHitbox

var KNOCKBACK_MULTIPLIER := 225# 225 optimalnoe znachenie #500 dlya testa

func _ready() -> void:
	damage = get_node("../../../stats").damage * 2.5 #* damage#zvuchit kak govno?(pochemu ne prosto 2.5(2.5 * 1 = 2.5))
	

func knockback(body) -> Vector2:# WIP
	var direction = (body.global_position - get_node("../").global_position).normalized()
	return direction * KNOCKBACK_MULTIPLIER
