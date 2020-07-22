#WIP
class_name KnightAOEHitbox
extends BaseHitscanHitbox

var knockback_vector = Vector2.ZERO

func _ready() -> void:
	damage = 2.5 #* damage#zvuchit kak govno?(pochemu ne prosto 2.5(2.5 * 1 = 2.5))
	

func knockback(body):#WIP
	var direction = body.global_position - get_node("../").global_position
	
