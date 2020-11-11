class_name GoblinProjectileAttack
extends BaseProjectileAttackEnemy

onready var animation_player = get_node("../AttackPlayer")

func _ready() -> void: 
	projectile = preload("res://src/characters/base_npc/range_goblin/attack/goblin_projectile.tscn")
	_INTERVAL = 0.5


func _start():
	animation_player.play("attack")
	._start()
