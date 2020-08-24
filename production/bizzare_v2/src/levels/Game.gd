extends Control

func load_level():
	var root = get_tree().get_root()
	if root.has_node("level"):
		root.remove_child($Level) 
	var new_level = load("res://src/levels/world_test_level.tscn")
	root.add_child(new_level)
