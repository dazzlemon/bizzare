class_name Phase1Attack2Control
extends Control

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_1_attack_2/phase_1_attack_2_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")

var count = 0 
var spiral_count = 0 


func projectile_spiral(angle):
	if count < 8:
		var projectile_instance = projectile.instance()
		get_root.owner.call_deferred("add_child", projectile_instance)
		projectile_instance.transform = get_root.global_transform
		projectile_instance.direction = (Vector2(sin(deg2rad(angle)), cos(deg2rad(angle))))#- get_node("../").global_position).normalized() 
		projectile_instance.damage = stats.dmg
		count += 1
	else: 
		get_node("cd").start(10)
		count = 0 
		get_parent.is_ready = false

func try_use():
	get_node("wave_interval").start()


func _on_cd_timeout():
	get_parent.is_ready = true


func _on_wave_interval_timeout():
	if get_parent.is_ready:
		#projectile_spiral(10)
		get_parent.is_ready = false
		get_node("wave_interval").start()


func _on_spiral_interval_timeout():
	var angle = 25
	if spiral_count <= 36:
		get_node("spiral_interval").start(0.05)
		spiral_count += 1
		projectile_spiral(angle * spiral_count)
	else: 
		spiral_count = 0
