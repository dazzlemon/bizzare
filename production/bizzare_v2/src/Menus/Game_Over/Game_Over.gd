extends CanvasLayer


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	LoadingScreen.load_scene("res://src/levels/Game.tscn")
	LoadingScreen.visible = true
	get_node("../level").queue_free()
	queue_free()

