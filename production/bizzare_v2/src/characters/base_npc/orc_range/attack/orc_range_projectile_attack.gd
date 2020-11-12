class_name GoblinProjectileAttack
extends BaseProjectileAttackEnemy

onready var animation_player = get_node("../AttackPlayer")

func _ready() -> void: 
	projectile = preload("res://src/characters/base_npc/orc_range/attack/orc_range_projectile.tscn")
	_INTERVAL = 0.5


func _start():
	animation_player.play("attack")
	._start()
