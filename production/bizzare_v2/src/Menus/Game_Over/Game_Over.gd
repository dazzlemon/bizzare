extends CanvasLayer

onready var label = $Label
var _text 

func _ready():
	label.text = _text
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Button_pressed():
	LoadingScreen.load_scene("res://src/levels/Game.tscn")
	LoadingScreen.visible = true
	get_node("../level").queue_free()
	queue_free()

#func _process(delta):
#	label.set_text(_text)
