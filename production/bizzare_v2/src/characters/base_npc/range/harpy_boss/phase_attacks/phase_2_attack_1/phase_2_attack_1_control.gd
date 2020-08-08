class_name Phase2Attack1Control
extends Control

onready var lightning = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_2_attack_1/phase_2_attack_1_hitscan.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")

var step = 0
var interval = 2
var is_ready = true 
var lightning_angle = 0

func hitscan_lightning(amount,lightning_angle):
	for i in range (amount):
		var lightning_instance =  lightning.instance()
		get_root.owner.call_deferred("add_child", lightning_instance)
		lightning_instance.position =  get_node("../../").global_position
		lightning_instance.rotation += lightning_angle
		step=10
		lightning_angle += deg2rad(15)
		interval = 2

func try_use():
	is_ready = true
	get_node("wave_interval").start()


func _on_wave_interval_timeout():
	if is_ready:
		if step < 80: 
			step += 10
			hitscan_lightning(24,lightning_angle)
		else:
			step = 0
			is_ready = false
