class_name MageProjectileAttack
extends BaseProjectileAttackAlly

func _ready():
	projectile = preload("res://src/characters/base_player/mage/attack/mage_projectile.tscn")
	_INTERVAL = 0.525
