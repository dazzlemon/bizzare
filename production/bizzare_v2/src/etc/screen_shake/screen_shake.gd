extends Control

var amplitude = 0
var priority = 0
var frequency = 8

onready var camera = get_parent()

func start(duration = 0.2 , amplitude = 16, priority = 0):
	if priority >= self.priority:
		self.priority = priority
		self.amplitude = amplitude
		$Duration.wait_time = duration
		$Frequency.wait_time = 1/ float(frequency)
		$Duration.start()
		$Frequency.start()

		_new_shake()


func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude,amplitude)
	rand.x = rand_range(-amplitude,amplitude)
	$Tween.interpolate_property(camera, "offset",camera.offset, rand, $Frequency.wait_time,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	
func _reset():
	$Tween.interpolate_property(camera, "offset",camera.offset, Vector2(), $Frequency.wait_time,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	priority = 0

func _on_Duration_timeout():
	_reset()
	$Frequency.stop()


func _on_Frequency_timeout():
	_new_shake()
