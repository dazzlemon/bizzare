class_name ExplosiveArrow
extends BaseProjectileAttackAlly


func _ready():
	projectile = preload("res://src/characters/base_player/archer/spells/explosion/explosive_arrow_projectile.tscn")
	_INTERVAL = 10

func try_use():
	if _is_able_to_use():
		get_node("duration").start()
		get_node("cd").start()
	.try_use()


func update_state():
	var projectile_instance = projectile.instance()
	get_node("../").owner.add_child(projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.rotation += get_node("../").get_angle_to(get_global_mouse_position())
	projectile_instance.direction = (get_global_mouse_position() - get_node("../").global_position).normalized()
	projectile_instance.explosion_damage = get_node("../stats").dmg * 3
