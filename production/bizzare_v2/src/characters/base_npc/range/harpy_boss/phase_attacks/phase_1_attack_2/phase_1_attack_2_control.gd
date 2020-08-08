class_name Phase1Attack2Control
extends Control

onready var projectile = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_1_attack_1/phase_1_attack_1_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")

var step = 0
var interval = 2
var is_ready = true 
var spiral_count = 0 


func projectile_spiral(angle):
	var projectile_instance = projectile.instance()
	get_root.owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform =  get_root.global_transform
	projectile_instance.direction = (Vector2(sin(deg2rad(angle)), cos(deg2rad(angle))) )#- get_node("../").global_position).normalized() 
	projectile_instance.damage = stats.dmg
	step = 10
	interval = 0.75
	get_node("spiral_interval").start(0.1)


func try_use():
	is_ready = true
	get_node("wave_interval").start()


func _on_wave_interval_timeout():
	if is_ready:
		if step < 80: 
			step += 10
			projectile_spiral(10)
		else:
			step = 0
			is_ready = false


func _on_spiral_interval_timeout():
	var angle = 25
	if spiral_count <= 36:
		get_node("spiral_interval").start(0.05)
		spiral_count += 1
		projectile_spiral(angle * spiral_count)
	else: 
		spiral_count = 0
