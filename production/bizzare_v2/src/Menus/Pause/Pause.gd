extends CanvasLayer

onready var control = $Control
onready var settings_menu = load("res://src/Menus/settings/Settings.tscn")
var is_settings_shown = false
var is_console_shown = false
#var music_level :float = 1

func _ready() -> void:
	set_visible(false)


func _input(event) -> void:
	if event.is_action_pressed("ui_cancel") and current_scene() != "title_screen" and not is_settings_shown and not is_console_shown : #and not is_settings_element_shown: #and  not has_node("input_menu") :
		pause_toggle()


func set_visible(is_visible) -> void:
	control.visible = is_visible


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Continue_pressed():
	pause_toggle()


func current_scene():
	return get_tree().get_current_scene().get_name()


func pause_toggle():
	get_tree().paused = not get_tree().paused
	set_visible(get_tree().paused)
	if not get_tree().get_root().get_node("Game/level") is RandomLevel:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		_mouse_mode_toggle()


func _mouse_mode_toggle():
	#MOUSE_MODE_HIDDEN
	#MOUSE_MODE_VISIBLE
	Input.set_mouse_mode(Utility.map(Input.get_mouse_mode(), 0, 1, 1, 0))



func _on_Save_pressed():
	SaveScript.write_save("test_save" , get_tree().get_root().get_node("Game/level/Trees/YSort/player"))


func _on_Load_pressed():
	SaveScript.read_save("test_save", get_tree().get_root().get_node("Game/level/Trees/YSort"))
	pause_toggle()


func _on_Settings_pressed():
	call_deferred("add_child", settings_menu.instance())
	is_settings_shown = true
	control.visible = false 


func _on_Restart_pressed():
	pause_toggle()
	get_tree().get_root().get_node("Game/level").queue_free()
	LoadingScreen.load_scene("res://src/levels/Game.tscn")
	LoadingScreen.visible = true
	set_visible(false)
	
