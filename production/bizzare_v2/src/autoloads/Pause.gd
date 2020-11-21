extends CanvasLayer



func _ready() -> void:
	set_visible(false)


func _input(event) -> void:
	if event.is_action_pressed("ui_cancel") and current_scene() != "title_screen":
		pause_toggle()


func set_visible(is_visible) -> void:
	for node in get_children():
		node.visible = is_visible


func _on_Screen_pressed() -> void:
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Continue_pressed():
	pause_toggle()


func current_scene():
	return get_tree().get_current_scene().get_name()


func pause_toggle():
	get_tree().paused = not get_tree().paused
	set_visible(get_tree().paused)
	if not get_tree().get_root().get_node("Game/level") is WorldTestLevel:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		_mouse_mode_toggle()


func _mouse_mode_toggle():
	#MOUSE_MODE_HIDDEN
	#MOUSE_MODE_VISIBLE
	Input.set_mouse_mode(Utility.map(Input.get_mouse_mode(), 0, 1, 1, 0))



func _on_Save_pressed():
	SaveScript.write_save_to_file("test_save" , get_tree().get_root().get_node("Game/level/Trees/YSort/player"))


func _on_Load_pressed():
	var parent = get_tree().get_root().get_node("Game/level/Trees/YSort")
	parent.remove_child(parent.get_node("player"))
	SaveScript._dict_to_player(SaveScript._file_to_dict("test_save"), parent)
	pause_toggle()
