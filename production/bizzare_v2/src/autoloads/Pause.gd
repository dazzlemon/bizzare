extends CanvasLayer


func _ready() -> void:
	set_visible(false)
	

func _input(event) -> void:
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = !get_tree().paused
		set_visible(get_tree().paused)


func _on_Button_pressed() -> void:
	get_tree().paused = false
	set_visible(false)


func set_visible(is_visible) -> void:
	for node in get_children():
		node.visible = is_visible


func _on_Screen_pressed() -> void:
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Exit_pressed() -> void:
	get_tree().quit()
