# any action that has to have cooldown
#
# how to use:
#   1) change INTERVAL, DURATION in _ready() function(next time use will be available after (INTERVAL+DURATION)sec passed)
#   2) override _start(), _stop() functions with respective <action> code
#   3) call try_use, when want to use action(it will use if cooldown is 0)
class_name SpellCdDuration
extends SpellCd

var _DURATION: float

onready var _duration = $duration

func _timers_start():
	_cd.start(_INTERVAL + _DURATION)
	_duration.start(_DURATION)


func _on_duration_timeout():
	_stop()


func _stop():
	pass#individual code here
