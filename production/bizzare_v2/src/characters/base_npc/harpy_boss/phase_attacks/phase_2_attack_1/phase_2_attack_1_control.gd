class_name Phase2Attack1Control
extends PhaseAttacks

onready var lightning = preload ("res://src/characters/base_npc/harpy_boss/phase_attacks/phase_2_attack_1/phase_2_attack_1_hitscan.tscn")

onready var get_root = get_node("../../")
onready var get_parent = get_node("../")

func _ready():
	_DURATION = 12
	_WAVE_INTERVAL = 3


func _start():
	hitscan_lightning(24)


func hitscan_lightning(amount):
	for i in range(0, amount, 1):
		spawn_lightning(360 / amount * i)


func spawn_lightning(angle):
	var lightning_instance = lightning.instance()
	get_root.get_node("../").call("add_child", lightning_instance)
	lightning_instance.global_position = get_node("../../").global_position 
	lightning_instance.global_position += (Vector2(rand_range(-150, 150), rand_range(-150, 150))).rotated(angle)
	lightning_instance.stats = get_node("../../stats")

func _stop():
	get_parent.phase_attack_ended()
