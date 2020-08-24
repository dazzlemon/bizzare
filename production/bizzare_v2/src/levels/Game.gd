extends Node

func load_level(player):
	var root = get_tree().get_root()
	if root.has_node("level"):
		root.remove_child($level) 
	var new_level = load("res://src/levels/world_test_level.tscn").instance()
	root.add_child(new_level)
	new_level.add_child(player)
