class_name Slime
extends BaseNPC

onready var timer = $Timer
onready var sprite = $pivot/sprite


var jump_interval = 2
var jump_time = 0.35
var jump_delay = 0.5
var jump_height = -7

func _ready():
	MAX_SPEED = 75
	timer.start(jump_interval)


func _on_Timer_timeout():
	if control.state != control.States.ATTACK:
		tween.interpolate_property(sprite, "position:y", 0, jump_height, jump_time , Tween.TRANS_SINE, Tween.EASE_IN , 0)
		tween.interpolate_property(sprite, "position:y", jump_height, 0, jump_time , Tween.TRANS_SINE, Tween.EASE_IN , jump_delay)
		tween.start()
