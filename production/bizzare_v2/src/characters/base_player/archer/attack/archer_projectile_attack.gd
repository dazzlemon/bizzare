class_name ArcherProjectileAttack
extends BaseProjectileAttackAlly

func _ready():
	projectile = preload("res://src/characters/base_player/archer/attack/archer_projectile.tscn")
	_INTERVAL = 0.525


func delayed_start():
	pass
