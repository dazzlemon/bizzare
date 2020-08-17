#
class_name BaseProjectileAttack
extends Control

var damage = 1
var projectile = preload("res://src/attack/projectile/base_projectile.tscn")
var ATTACK_INTERVAL = 0.5
var attack_active
var attack_wait_for_next_sec

func _ready():
	attack_active = false
	attack_wait_for_next_sec = 0


func _process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if attack_active:
		attack_active = false
		update_state()


func update_state():
	var projectile_instance = projectile.instance()
	get_node("../").owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	#projectile_instance.rotation += get_node("../").get_angle_to(get_node("../crosshair").global_position)#???useless?
	projectile_instance.direction = (get_node("../crosshair").global_position - get_node("../").global_position).normalized()#use local crosshair's position instead of mice's one
	projectile_instance.damage = self.damage


func try_use():
	if is_able_to_use():
		attack_active = true
		attack_wait_for_next_sec = ATTACK_INTERVAL


func is_able_to_use() -> bool:
	return attack_wait_for_next_sec <= 0
