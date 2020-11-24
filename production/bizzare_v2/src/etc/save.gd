class_name SaveScript
extends Node

const PASSWORD = ")HyIe1'61V_keotB"

static func _dict_to_player(dict, parent):
	var player = Utility.instance_of(dict["class"])
	parent.add_child(player)
	player.position = Vector2(dict["x"], dict["y"])
	for s in dict["stats"]:
		player.stats.set(s, dict["stats"][s])
	player.get_node("Inventory").array = dict["inventory"]
	#print(player.get_node("Inventory").array)
	#print(player.get_node("Inventory").currency_multiplier)


static func _file_to_dict(filename) -> Dictionary:
	var save_game = File.new()
	var dict := {}
	if save_game.file_exists(filename):
		var err = save_game.open_encrypted_with_pass(filename, File.READ, PASSWORD)
		if err:
			return dict#GGWP
		else:
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
		"currency" : player.get_node("Inventory").currency_amount,
		"currency_multiplier" : player.get_node("Inventory").currency_multiplier,
	}
	return dict


static func read_save(filename, parent):
	if parent.has_node("player"):
		parent.remove_child(parent.get_node("player"))
	_dict_to_player(_file_to_dict("test_save"), parent)


static func write_save(filename, player):
	var save_game = File.new()
	var err = save_game.open_encrypted_with_pass(filename, File.WRITE, PASSWORD)
	if err:
		return#GGWP
	else:
		save_game.store_line(to_json(_player_to_dict(player)))
		save_game.close()
