class_name ExplosiveArrowProjectile 
extends BaseProjectileAlly

var explosion_damage 
onready var explosion_scene = preload("res://src/characters/base_player/archer/spells/explosion/explosion_hitscan.tscn")


func die() -> void:
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	explosion.damage = explosion_damage
	get_tree().get_root().call_deferred("add_child", explosion)
	.die()



