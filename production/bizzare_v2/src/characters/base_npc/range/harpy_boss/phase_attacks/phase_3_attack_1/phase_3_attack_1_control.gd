class_name Phase3Attack1Control
extends SpellCd

var apprentice = preload("res://src/characters/base_npc/range/harpy_boss/apprentices/apprentice.tscn")
var apprentices := [] 
var amount = 5

onready var get_parent = get_node("../")
onready var get_root = get_node("../../")

func _process(delta: float) -> void:
	if not apprentices.empty():
		verify_apprentices()
		if apprentices.empty():
			get_parent.phase_attack_ended()
			get_root.DMG_BLOCK = 0


func _start() -> void:
	for i in range(0, amount, 1):
		apprentices.push_front(spawn_apprentice(360 / amount * i))


func verify_apprentices():#GADSTVO GAVNO IS JOPI
	var i = 0#wasnt working, so i didnt touch the code, but it could be optimized
	while i < apprentices.size():
		if apprentices[i].get_node("stats").health is float and apprentices[i].get_node("stats").health <= 0:# checking for float because it gets Nil from somewhere idk where(nice godot(govnot))
			apprentices[i].die()
			apprentices.remove(i)
		i += 1


func spawn_apprentice(angle):
	get_root.DMG_BLOCK = 1
	var apprentice_instance = apprentice.instance()
	get_node("../../").call_deferred("add_child", apprentice_instance)
	apprentice_instance.position = Vector2(50, 0).rotated(deg2rad(angle))
	return apprentice_instance


func _stop() -> void:
	get_parent.phase_attack_ended()
