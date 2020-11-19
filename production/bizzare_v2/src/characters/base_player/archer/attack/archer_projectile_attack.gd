class_name ArcherProjectileAttack
extends BaseProjectileAttackAlly

onready var attack_player = get_node("../AttackPlayer")

func _ready():
	projectile = preload("res://src/characters/base_player/archer/attack/archer_projectile.tscn")
	_INTERVAL = 0.525

func _start():
	attack_player.play("attack")
	._start()


func delayed_start():
	pass
