class_name Phase3Attack2Control
extends Node


var angle = 0 setget angle_set
var angle_step = 40

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_3_attack_2/tornado_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")
onready var ray_hitscan = $ray_hitscan


func projectile_tornado(amount, start):
	for i in range(0, amount, 1): #maybe potencialniy amount + 1
		spawn_projectile(deg2rad(start + 360 / amount * i))
	angle += angle_step


func spawn_projectile(angle):
	var projectile_instance = projectile.instance()
	get_root.owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_root.global_transform
	projectile_instance.position = get_root.global_position + Vector2(0, 150).rotated(angle)
	projectile_instance.direction = (Vector2(sin(angle), cos(angle)))
	projectile_instance.damage = stats.damage


func angle_set(angle_new):
	angle = angle_new
	while angle >= 360:
		angle -= 360


func start():
	get_node("wave_interval").start()
	get_node("duration").start()
	ray_hitscan.try_use()

func _on_wave_interval_timeout():
	projectile_tornado(3, angle)


func _on_duration_timeout():
	get_parent.phase_attack_ended()
	get_node("wave_interval").stop()
	
