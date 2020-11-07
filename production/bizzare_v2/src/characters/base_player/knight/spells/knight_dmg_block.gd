#WIP
#
#mb refactor to use only one timer
class_name KnightDMGBlock
extends SpellCdDuration

onready var parent = get_node("../")
onready var particles1 = get_node("fire_part")
onready var particles2 = get_node("ash")

func _ready() -> void:
	_DURATION = 5
	_INTERVAL = 10


func _start() -> void:
	particle_toggle()
	parent.DMG_BLOCK = 0.3


func _stop() -> void:
	particle_toggle()
	parent.DMG_BLOCK = 0

func particle_toggle():
	particles1.emitting = not particles1.emitting
	particles2.emitting = not particles2.emitting
