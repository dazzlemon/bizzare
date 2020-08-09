class_name Phase1Attack1Control
extends Control

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_1_attack_1/phase_1_attack_1_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")

var count = 0

func projectile_circle(amount, start):
	for i in range(0, amount, 1): #maybe potencialniy amount + 1 
		if count < 8:
			print("04ko")
			var projectile_instance = projectile.instance()
			get_root.owner.call_deferred("add_child", projectile_instance)
			projectile_instance.transform =  get_root.global_transform
			projectile_instance.direction = (Vector2(sin(deg2rad(start + 360/amount * i)), cos(deg2rad(start + 360/amount * i))) )
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
		projectile_circle(24, count * 10)
		get_parent.is_ready = false
		get_node("wave_interval").start()
