extends Node

func load_level(player):
	if has_node("level"):
		remove_child($level) 
	var new_level = preload("res://src/levels/world_test_level.tscn").instance()
	new_level.add_child(player)
	add_child(new_level)