extends Control


func _on_Controls_pressed():
	queue_free()
	InputMapSettings._show()


func _on_Graphics_pressed():
	OS.window_fullscreen = not OS.window_fullscreen


func _on_cancel_pressed():
	Pause.is_settings_shown = false
	Pause.set_visible(true)
	queue_free()

