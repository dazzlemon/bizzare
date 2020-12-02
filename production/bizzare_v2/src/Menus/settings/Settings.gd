extends Control

onready var audio = load("res://src/Menus/audio_menu/audio_menu.tscn")
onready var Vbox = $VBoxContainer
var is_element_shown = false

func _on_Controls_pressed():
	queue_free()
	InputMapSettings._show()


func _on_Graphics_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Audio_pressed():
	_visible()
	var audio_instance = audio.instance()
	is_element_shown = true
	call_deferred("add_child", audio_instance)


func _visible():
	for node in get_children():
		node.visible = not node.visible


func _on_back_pressed():
	if get_tree().get_current_scene().get_name() == "Game":
		Pause.is_settings_shown = false
		Pause.set_visible(true)
	queue_free()


func _process(delta):
	if Input.is_action_just_pressed("ui_cancel") and not is_element_shown:
		_on_back_pressed()
