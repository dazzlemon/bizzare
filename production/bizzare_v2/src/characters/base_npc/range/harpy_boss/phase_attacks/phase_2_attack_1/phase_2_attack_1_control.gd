class_name Phase2Attack1Control
extends PhaseAttacks

onready var lightning = preload ("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_2_attack_1/phase_2_attack_1_hitscan.tscn")
onready var stats = get_node("../../stats")
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
#
#
func spawn_lightning(angle):
	var lightning_instance = lightning.instance()
	get_root.owner.call_deferred("add_child", lightning_instance)
	lightning_instance.position = get_node("../../").global_position
	lightning_instance.rotation += angle

func _stop():
	get_parent.phase_attack_ended()
