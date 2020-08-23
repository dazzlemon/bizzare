#WIP
#
#mb refactor to use only one timer
class_name KnightDMGBlock
extends SpellCdDuration

onready var parent = get_node("../")

func _ready() -> void:
	_DURATION = 5
	_INTERVAL = 10


func _start() -> void:
	parent.DMG_BLOCK = 0.3


func _stop() -> void:
	parent.DMG_BLOCK = 0
