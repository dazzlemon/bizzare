class_name Phase2Attack2Control
extends Control

onready var lightning_circle = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_2_attack_2/phase_2_attack_2_hitscan.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")

func hitscan_lightning_circle(amount):
#	for _i in range (amount):
#		var lightning_circle_instance = lightning_circle.instance()
#		get_root.owner.call_deferred("add_child", lightning_circle_instance)
	pass#spawn ring/hoop


func try_use():
	get_node("wave_interval").start()


func _on_cd_timeout():
	get_parent.is_ready = true


func _on_wave_interval_timeout():
	if get_parent.is_ready:
		hitscan_lightning_circle(24)
		get_parent.is_ready = false
		get_node("wave_interval").start()
