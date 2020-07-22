#damaging area, probably will be removed in consequence of refactor
class_name BaseHitscanHitbox
extends Area2D

export var damage = 1

func _on_hitbox_area_entered(area):
	area.get_node("../").take_damage(damage)
