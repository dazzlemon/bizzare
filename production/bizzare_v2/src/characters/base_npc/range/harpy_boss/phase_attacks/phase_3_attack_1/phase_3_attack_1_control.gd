class_name Phase3Attack1Control
extends Node

var apprentice = preload("res://src/characters/base_npc/range/harpy_boss/apprentices/apprentice.tscn")
var apprentices : Array = [] 
var amount = 5
var is_ready := true

onready var get_parent = get_node("../")
onready var get_root = get_node("../../")

func _process(delta):
	if not apprentices.empty():
		for i in range(apprentices.size()):
			if typeof(apprentices[i]) == TYPE_NIL:
				apprentices.remove(i)
				is_ready = false
		if apprentices.empty():
			print("04ko")
			get_parent.phase_attack_ended()
			get_root.DMG_BLOCK = 0


func start():
	for i in range(0, amount, 1):
		apprentices.push_front(spawn_apprentice(360 / amount * i))
		

func spawn_apprentice(angle):
	get_root.DMG_BLOCK = 1
	var apprentice_instance = apprentice.instance()
	get_node("../../").call_deferred("add_child", apprentice_instance)
	apprentice_instance.position = Vector2(50, 0).rotated(deg2rad(angle))
	return apprentice_instance
