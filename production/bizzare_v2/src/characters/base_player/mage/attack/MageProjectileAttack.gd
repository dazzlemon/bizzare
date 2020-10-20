class_name MageProjectileAttack
extends BaseProjectileAttackAlly

func _ready():
	damage = get_node("../stats").damage
	projectile = preload("res://src/characters/base_player/mage/attack/mage_projectile.tscn")
	_INTERVAL = 0.525
