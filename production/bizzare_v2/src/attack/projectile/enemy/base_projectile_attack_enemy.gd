#
class_name BaseProjectileAttackEnemy
extends BaseProjectileAttack

func _ready() -> void:
	projectile = preload("res://src/attack/projectile/enemy/base_projectile_enemy.tscn")
