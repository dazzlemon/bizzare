#WIP
#
#mb refactor to use only one timer
class_name KnightDMGBlock
extends SpellCdDuration

onready var parent = get_node("../")

func _ready():
	_DURATION = 5
	_INTERVAL = 10

func _start():
	parent.DMG_BLOCK = 0.3


func _stop():
	parent.DMG_BLOCK = 0
