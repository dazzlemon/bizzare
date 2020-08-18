# any action that has to have cooldown
#
# how to use:
#   1) change INTERVAL in _ready() function
#   2) override _start() function with <action> code
#   3) call try_use, when want to use action(it will use if cooldown is 0)
class_name SpellCd
extends Node2D

var _INTERVAL: float#const

onready var _cd = $cd

func _start():
	pass#actual spell


func try_use():
	if _is_able_to_use():
		_timers_start()
		_start()


func _timers_start():
	_cd.start(_INTERVAL)
  

func _is_able_to_use():
	return _cd.time_left == 0
