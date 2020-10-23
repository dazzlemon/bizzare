extends CanvasLayer

var mouse_mode

func _ready() -> void:
	set_visible(false)
	

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
#		mouse_mode = Input.get_mouse_mode()
#		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
#			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
#		else:
#			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = not get_tree().paused
		set_visible(get_tree().paused)


func set_visible(is_visible) -> void:
	for node in get_children():
		node.visible = is_visible
	if is_visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func _on_Screen_pressed() -> void:
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Continue_pressed():
	get_tree().paused = false
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	set_visible(false)
