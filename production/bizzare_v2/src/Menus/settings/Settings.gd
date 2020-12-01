extends Control

onready var audio = load("res://src/Menus/audio_menu/audio_menu.tscn")
onready var Vbox = $VBoxContainer

func _on_Controls_pressed():
	queue_free()
	InputMapSettings._show()


func _on_Graphics_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_cancel_pressed():
	Pause.is_settings_shown = false
	Pause.set_visible(true)
	queue_free()


func _on_Audio_pressed():
	_visible()
	var audio_instance = audio.instance()
	#audio_instance.global_position = 
	call_deferred("add_child", audio_instance)


func _visible():
	for node in get_children():
		node.visible = not node.visible
