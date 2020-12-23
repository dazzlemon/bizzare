class_name Meteor
extends BaseProjectileAttackAlly


func _ready() -> void:
	projectile = preload("res://src/characters/base_player/mage/spells/meteor/meteor.tscn")
	_INTERVAL = 10


func _start() -> void:
	var projectile_instance = projectile.instance()
	#print()
	owner.get_parent().owner.add_child(projectile_instance)
	projectile_instance.global_position = get_node("../crosshair").global_position + Vector2(0,-200)
	projectile_instance.direction = Vector2.DOWN
	projectile_instance.target = get_node("../crosshair").global_position
	projectile_instance.explosion_damage = get_node("../stats").damage * 3

