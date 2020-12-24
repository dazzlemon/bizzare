class_name GoblinProjectileAttack
extends BaseProjectileAttackEnemy

onready var animation_player = get_node("../AttackPlayer")

func _ready() -> void: 
	projectile = preload("res://src/characters/base_npc/orc_range/attack/orc_range_projectile.tscn")
	_INTERVAL = 0.5


func _start():
	animation_player.play("attack")
	#kostil'
	var projectile_instance = projectile.instance()
	level.call_deferred("add_child", projectile_instance)
	projectile_instance.global_position = parent.global_position
	projectile_instance.direction = (parent.crosshair.global_position - global_position).normalized()
	projectile_instance.damage = stats.damage
	if get_node("../Sound/attack"):
		get_node("../Sound/attack").playing = true
	projectile_instance.rotation = get_angle_to(get_node("../crosshair").global_position)
