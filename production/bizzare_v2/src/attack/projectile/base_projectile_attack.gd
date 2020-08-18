#
class_name BaseProjectileAttack
extends SpellCd

var damage = 1
var projectile = preload("res://src/attack/projectile/base_projectile.tscn")

func _ready():
	_INTERVAL = 0.5

func _start():
	var projectile_instance = projectile.instance()
	get_node("../").owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.direction = (get_node("../crosshair").global_position - get_node("../").global_position).normalized()
	projectile_instance.damage = self.damage
