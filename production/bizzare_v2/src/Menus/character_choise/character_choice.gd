extends Panel

var player_class = player_classes.KNIGHT

const knight = preload("res://src/characters/base_player/knight/knight.tscn")
const archer = preload("res://src/characters/base_player/archer/archer.tscn")


enum player_classes {
	KNIGHT,
	ARCHER,
}

var player_classes_dict = {
	player_classes.KNIGHT : [knight, preload("res://src/characters/base_player/knight/knight_stats.gd")],
	player_classes.ARCHER : [archer, preload("res://src/characters/base_player/archer/archer_stats.gd")],
}

func _on_KnightButton_pressed():
	player_class = player_classes.KNIGHT


func _on_ArcherButton_pressed():
	player_class = player_classes.ARCHER


func _on_start_button_pressed():
	var player = player_classes_dict[player_class][0].instance()
	player.name = "player"
	get_tree().get_root().get_node("Game").load_level(player)
