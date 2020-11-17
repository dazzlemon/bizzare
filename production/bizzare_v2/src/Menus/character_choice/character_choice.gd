extends Panel

class PlayableChar:
	var scene
	var stats_script
	var scene_script 
	var texture
	var flip_h

	func _init(scene, stats_script, scene_script, texture, flip_h = false):
		self.scene = scene
		self.stats_script = stats_script
		self.scene_script = scene_script
		self.texture = texture
		self.flip_h = flip_h

var knight = PlayableChar.new(
	preload("res://src/characters/base_player/knight/knight.tscn"),
	preload("res://src/characters/base_player/knight/knight_stats.gd"),
	preload("res://src/characters/base_player/knight/knight.gd"),
	load("res://assets/textures/knight/knight24.png")
)
var archer = PlayableChar.new(
	preload("res://src/characters/base_player/archer/archer.tscn"),
	preload("res://src/characters/base_player/archer/archer_stats.gd"),
	preload("res://src/characters/base_player/archer/archer.gd"),
	load("res://assets/textures/archer/archer24.png"), true
)

var mage = PlayableChar.new(
	preload("res://src/characters/base_player/mage/mage.tscn"),
	preload("res://src/characters/base_player/mage/mage_stats.gd"),
	preload("res://src/characters/base_player/mage/mage.gd"),
	load("res://assets/textures/mage/mage_run_side1.png")
)

onready var player_class = knight
onready var icon = get_node("VBoxContainer/TextureRect")

func _on_start_button_pressed():
	var player = player_class.scene.instance()
	player.name = "player"
	get_tree().get_root().get_node("Game").load_level(player)#im not sure we can remove get_node from here


func _change_class(class_str):
	var _class = .get(class_str)
	player_class = _class
	icon.texture = _class.texture
	icon.flip_h = _class.flip_h
