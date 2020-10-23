#WIP
class_name WorldTestLevel
extends Node2D

onready var player = $player

func _ready() -> void:
	OS.window_fullscreen = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

#func _process(delta):
#	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
