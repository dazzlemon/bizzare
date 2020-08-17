#
class_name BaseProjectileAttack
extends Control

var damage = 1
var projectile = preload("res://src/attack/projectile/base_projectile.tscn")
var ATTACK_INTERVAL = 0.5

func spawn_projectile():
	var projectile_instance = projectile.instance()
	get_node("../").owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.direction = (get_node("../crosshair").global_position - get_node("../").global_position).normalized()
	projectile_instance.damage = self.damage


func try_use():
	if is_able_to_use():
		spawn_projectile()
		get_node("cd").start(ATTACK_INTERVAL)


func is_able_to_use() -> bool:
	return (get_node("cd").time_left == 0)
