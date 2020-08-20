# any action that has to have cooldown + duration + wave interval
#
# how to use:
#   1) change INTERVAL, DURATION , WAVE_INTERVAL in _ready() function(next time use will be available after (INTERVAL+DURATION)sec passed)
#   2) override _start(), _stop() functions with respective <action> code
#   3) call try_use, when want to use action(it will use if cooldown is 0)
class_name SpellCdDurationWave
extends SpellCdDuration

onready var _wave_interval = $wave_interval
var _WAVE_INTERVAL: float

func _process(_delta):
	print(str(_wave_interval.time_left))


func _on_wave_interval_timeout():
	_start()


func _on_duration_timeout():
	_wave_interval.stop()
	_stop()


func _timers_start():
	_wave_interval.start(_WAVE_INTERVAL)
	._timers_start()
