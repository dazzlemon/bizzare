class_name SaveScript
extends Node

onready var player = get_tree().get_root().get_node("level/player")
onready var stats = player.get_node("stats")


static func _load_file(player):	
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	player.queue_free()
	save_game.open("user://savegame.save", File.READ)
	while save_game.get_position() < save_game.get_len():# Get the saved dictionary from the next line in the save file
		var node_data = parse_json(save_game.get_line())
		var new_object = load(node_data["filename"]).instance()
		get_node(node_data["parent"]).add_child(new_object)
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])# Now we set the remaining variables.
		for i in node_data.keys():
			if i == "filename" or i == "parent" or i == "pos_x" or i == "pos_y":
				continue
			new_object.set(i, node_data[i])
	save_game.close()


static func save_player():
	var save_dict = {
		"filename" : get_filename(), 
		"parent" : get_parent().get_path(),
		"pos_x" : player.position.x, # Vector2 is not supported by JSON
		"pos_y" : player.position.y,
		"health" : player.stats.health,
		"max_health" : player.stats.max_health,
		"armor" : player.stats.armor,
		"max_armor" : player.stats.max_armor,
		"damage" : player.stats.damage,
		"inventory" : player.get_node("inventory").array,
	}
	return save_dict


static func write_save_to_file():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(save_player()))
	save_game.close()
