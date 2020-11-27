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
	
