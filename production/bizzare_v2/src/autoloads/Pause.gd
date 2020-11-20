extends CanvasLayer


#onready var player = get_tree().get_root().get_node("level/player")
#onready var stats = player.get_node("stats")

func _ready() -> void:
	set_visible(false)


func _input(event) -> void:
	if event.is_action_pressed("ui_cancel") and current_scene() != "title_screen":
		pause()


func set_visible(is_visible) -> void:
	for node in get_children():
		node.visible = is_visible


func _on_Screen_pressed() -> void:
	OS.window_fullscreen = not OS.window_fullscreen


func _on_Exit_pressed() -> void:
	get_tree().quit()


func _on_Continue_pressed():
	pause()


func current_scene():
	return get_tree().get_current_scene().get_name()


func pause():
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


#func _on_Save_pressed():
#	write_save_to_file()
#
#func _on_Load_pressed():
#	var save_game = File.new()
#	player.queue_free()
#	save_game.open("user://savegame.save", File.READ)
#	while save_game.get_position() < save_game.get_len():# Get the saved dictionary from the next line in the save file
#		var node_data = parse_json(save_game.get_line())
#		var new_object = load(node_data["filename"]).instance()
#		get_node(node_data["parent"]).add_child(new_object)
#		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])# Now we set the remaining variables.
#		for i in node_data.keys():
#			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
#				continue
#			new_object.set(i, node_data[i])
#	save_game.close()
#
#
#func save_player():
#	var save_dict = {
#		"filename" : get_filename(),
#		"parent" : get_parent().get_path(),
#		"pos_x" : player.position.x, # Vector2 is not supported by JSON
#		"pos_y" : player.position.y,
#		"health" : player.stats.health,
#		"max_health" : player.stats.max_health,
#		"armor" : player.stats.armor,
#		"max_armor" : player.stats.max_armor,
#		"damage" : player.stats.damage,
#		#"is_alive" : is_alive,
#	}
#	return save_dict
#
#
#func write_save_to_file():
#	var save_game = File.new()
#	save_game.open("user://savegame.save", File.WRITE)
#	save_game.store_line(to_json(save_player()))
#	save_game.close()	
	
