# damaging area, probably will be removed in consequence of refactor
#
# (actually probably wont be removed because stores damage(need to move damage to stats))
class_name BaseHitscanHitbox
extends Area2D

export var damage = 1

func _ready():
	randomize()
	get_node("CollisionShape2D").position = Vector2(0 , rand_range(50,200))
