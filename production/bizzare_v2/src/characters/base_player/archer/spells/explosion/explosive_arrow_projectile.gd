class_name ExplosiveArrowProjectile 
extends BaseProjectileAlly

var explosion_damage 
onready var explosion_scene = preload("res://src/characters/base_player/archer/spells/explosion/explosion_hitscan.tscn")

func _ready():
	damage = 0


func die():
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	explosion.get_node("Position2D/hitbox").damage = explosion_damage
	get_tree().get_root().call_deferred("add_child", explosion)
	.die()



