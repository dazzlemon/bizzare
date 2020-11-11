class_name HarpyProjectileAttack
extends BaseProjectileAttackEnemy

func _ready():
	projectile = preload("res://src/characters/base_npc/harpy/attack/harpy_projectile.tscn")
	_INTERVAL = 2
