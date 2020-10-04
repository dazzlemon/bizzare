class_name ArcherProjectileAttack
extends BaseProjectileAttackAlly

func _ready():
	damage = get_node("../stats").damage
	projectile = preload("res://src/characters/base_player/archer/attack/archer_projectile.tscn")
	_INTERVAL = 0.525

#func _start():
	#pass

func delayed_start():
	pass
