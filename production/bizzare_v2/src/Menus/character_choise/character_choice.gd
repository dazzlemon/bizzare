extends Panel

var player_class = player_classes.KNIGHT

onready var icon = get_node("VBoxContainer/TextureRect")

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
	icon.texture = load("res://assets/textures/knight_v04_new1.png")

func _on_ArcherButton_pressed():
	player_class = player_classes.ARCHER
	icon.texture = load("res://assets/textures/Archer.png")

func _on_start_button_pressed():
	var player = player_classes_dict[player_class][0].instance()
	player.name = "player"
	get_tree().get_root().get_node("Game").load_level(player)#im not sure we can remove get_node from here
