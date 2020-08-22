class_name ExplosiveArrow
extends BaseProjectileAttackAlly

func _ready():
	projectile = preload("res://src/characters/base_player/archer/spells/explosion/explosive_arrow_projectile.tscn")
	_INTERVAL = 10


func _start():
	var projectile_instance = projectile.instance()
	parent.owner.add_child(projectile_instance)
	projectile_instance.transform = parent.global_transform
	projectile_instance.rotation += parent.get_angle_to(get_global_mouse_position())
	projectile_instance.direction = (get_global_mouse_position() - parent.global_position).normalized()
	projectile_instance.explosion_damage = get_node("../stats").damage * 3
