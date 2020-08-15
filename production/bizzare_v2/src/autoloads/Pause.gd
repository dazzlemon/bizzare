extends CanvasLayer


func _ready():
	set_visible(false)
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		set_visible(!get_tree().paused)#hide if not paused
		get_tree().paused = !get_tree().paused#switch status


func _on_Button_pressed():
	get_tree().paused = false
	set_visible(false)


func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_Screen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Exit_pressed():
	get_tree().quit()
