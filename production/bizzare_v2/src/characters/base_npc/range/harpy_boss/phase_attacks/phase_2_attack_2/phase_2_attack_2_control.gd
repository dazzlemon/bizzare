class_name Phase2Attack2Control
extends Control

onready var lightning_circle = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_2_attack_2/phase_2_attack_2_hitscan.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")

var range_diff = 5
var step = 1
var interval = 2
var is_ready = true 
var lightning_angle = 0

func hitscan_lightning_circle(amount,lightning_angle):
	for i in range (amount):
		var lightning_circle_instance =  lightning_circle.instance()
		get_root.owner.call_deferred("add_child", lightning_circle_instance)
		lightning_circle_instance.position =  get_node("../../").global_position
		lightning_circle_instance.rotation += lightning_angle
		lightning_angle += deg2rad(15)
		interval = 2
		lightning_circle_instance.position = Vector2(0 , range_diff * step)


func try_use():
	is_ready = true
	get_node("wave_interval").start()


func _on_wave_interval_timeout():
	if is_ready:
		if step < 80: 
			step += 10
			hitscan_lightning_circle(24,lightning_angle)
		else:
			step = 0
			is_ready = false

