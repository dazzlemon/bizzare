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
	
	
	for i in new_level.get_node("Trees/YSort").get_children():
		print(i.name)
	
	new_level.get_node("Trees/YSort").remove_child($player)
	var dict = SaveScript._player_to_dict(player)
	SaveScript._dict_to_player(dict, new_level.get_node("Trees/YSort"))
	
	for i in new_level.get_node("Trees/YSort").get_children():
		print(i.name)
