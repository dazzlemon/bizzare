class_name ShiftDodge
extends SpellCdDuration

func _ready():
	_INTERVAL = 3
	_DURATION = 0.25


func _start():
	get_node("../pivot/sprite").modulate = Color (1,1,1,0.5)
	get_node("../").DMG_BLOCK = 1
	get_node("../pivot/hands").modulate = Color (1,1,1,0.5) 


func _stop():
	get_node("../pivot/sprite").modulate = Color (1,1,1,1)
	get_node("../").DMG_BLOCK = 0
	get_node("../pivot/hands").modulate = Color (1,1,1,1)