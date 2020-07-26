class_name ExplosiveArrow
extends BaseProjectileAttackAlly


func _ready():
	projectile = preload("res://src/characters/base_player/archer/spells/explosion/explosive_arrow_projectile.tscn")
	ATTACK_INTERVAL = 10

func try_use():
	if is_able_to_use():
		get_node("duration").start()
		get_node("cd").start()
	.try_use()
