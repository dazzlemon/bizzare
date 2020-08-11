class_name Phase3Attack1Control
extends Node

var apprentice = preload("res://src/characters/base_npc/range/harpy_boss/apprentices/apprentice.tscn")
var apprentices = [] 
var amount = 5

func start():
	for i in range(0, amount, 1):
		apprentices.push_front(spawn_apprentice(360 / amount * i))
		

func spawn_apprentice(angle):
	var apprentice_instance = apprentice.instance()
	get_node("../../").call_deferred("add_child", apprentice_instance)
	apprentice_instance.position = Vector2(sin(deg2rad(angle)), cos(deg2rad(angle))) * 50
	return apprentice_instance
