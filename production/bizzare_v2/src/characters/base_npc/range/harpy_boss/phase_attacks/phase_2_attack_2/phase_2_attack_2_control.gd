class_name Phase2Attack2Control
extends Control

onready var lightning_circle = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_2_attack_2/phase_2_attack_2_hitscan.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")


var range_diff = 5
var count = 1
var interval = 2

var lightning_angle = 0

func hitscan_lightning_circle(amount,lightning_angle):
	for i in range (amount):
		if count < 9:
			var lightning_circle_instance = lightning_circle.instance()
			get_root.owner.call_deferred("add_child", lightning_circle_instance)
			lightning_circle_instance.position =  get_node("../../").global_position
			lightning_circle_instance.rotation += lightning_angle
			lightning_angle += deg2rad(15)
			interval = 2
			lightning_circle_instance.position = Vector2(0 , range_diff * count)
			count += 1
		else: 
			count = 0
			get_parent.is_ready = false


func try_use():
	get_node("wave_interval").start()


func _on_cd_timeout():
	get_parent.is_ready = true


func _on_wave_interval_timeout():
	if get_parent.is_ready:
		hitscan_lightning_circle(24, lightning_angle)
		get_parent.is_ready = false
		get_node("wave_interval").start()
