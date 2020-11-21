extends Node

func _ready():
	OS.window_fullscreen = true

func load_level(player):
	if has_node("level"):
		remove_child($level) 
	var new_level = preload("res://src/levels/world_test_level.tscn").instance()
	new_level.get_node("Trees/YSort").add_child(player)
	player.z_as_relative = true
	player.global_position = Vector2(-370, -450)
	add_child(new_level)
	

#	new_level.get_node("Trees/YSort").remove_child(player)
#	SaveScript.write_save_to_file("test_save" , player)
#	SaveScript._dict_to_player(SaveScript._file_to_dict("test_save"), new_level.get_node("Trees/YSort"))

