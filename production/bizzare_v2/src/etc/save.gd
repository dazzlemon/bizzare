class_name SaveScript
extends Node

static func _dict_to_player(dict, parent):
	var player = Utility.instance_of(dict["class"])
	parent.add_child(player)
	player.position = Vector2(dict["x"], dict["y"])
	for s in dict["stats"]:
		player.stats.set(s, dict["stats"][s])
	player.get_node("Inventory").array = dict["inventory"]
	print(player.get_node("Inventory").array)


static func _file_to_dict(filename) -> Dictionary:
	var save_game = File.new()
	var dict := {}
	if save_game.file_exists(filename):
		save_game.open(filename, File.READ)
		while save_game.get_position() < save_game.get_len():
			dict = parse_json(save_game.get_line())
		save_game.close()
	return dict


static func _player_to_dict(player) -> Dictionary:
	var dict = {
		"class" : Utility.get_typeof(player),
		"x" : player.position.x,
		"y" : player.position.y,
		"stats" : {
			"health" : player.stats.health ,
			"max_health" : player.stats.max_health,
			"armor" : player.stats.armor,
			"max_armor" : player.stats.max_armor,
			"damage" : player.stats.damage,
		},
		"inventory" : player.get_node("Inventory").array,
	}
	return dict


static func write_save_to_file(filename, player):
	var save_game = File.new()
	save_game.open(filename, File.WRITE)
	save_game.store_line(to_json(_player_to_dict(player)))
	save_game.close()

