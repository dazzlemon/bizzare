class_name StatusBar
extends Control

onready var status_bar = $status_bar
onready var stats = get_node("../../stats")
onready var update_tween = $UpdateTween
onready var animation = $animation
onready var label = $RichTextLabel

func _process(delta):
	update_max_value()
	update_value()


func update_max_value():
	pass

func update_value():
	pass
