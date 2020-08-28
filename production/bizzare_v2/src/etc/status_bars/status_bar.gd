class_name StatusBar
extends Control

onready var status_bar = $status_bar
onready var stats = get_node("../../stats")
onready var update_tween = $UpdateTween
onready var animation = $animation
onready var label = $RichTextLabel
onready var pulse_tween = $PulseTween

#export (Color) var pulse_color = Color ("#902a34")
#var is_pulsing = false
var max_value_str = "max_health" #DEFAULT VALUE
var value_str = "health" #DEFAULT VALUE

func _process(delta):
	update_max_value()
	update_value()


func _ready():
	status_bar.max_value = stats.get(max_value_str)
	status_bar.value = stats.get(max_value_str)
	animation.max_value = stats.get(max_value_str)


func update_max_value():
	status_bar.value = status_bar.value / stats.get(max_value_str) * status_bar.max_value #NEED PT
	animation.value = animation.value / stats.get(max_value_str) * animation.max_value # NEED PT
	status_bar.max_value = stats.get(max_value_str)
	animation.max_value = stats.get(max_value_str)


func update_value():
	if status_bar.value != stats.get(value_str):
		status_bar.value = stats.get(value_str)
		update_tween.interpolate_property(animation, "value", animation.value, stats.get(value_str), 0.175, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.175)
		update_tween.start()
#		if is_pulsing:
#			pulse()

#func pulse():
#	pass
