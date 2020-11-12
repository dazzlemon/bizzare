extends Panel

class PlayableChar:
	var scene
	var stats_script
	var scene_script 

	func _init(scene, stats_script, scene_script):
		self.scene = scene
		self.stats_script = stats_script
		self.scene_script = scene_script

var knight = PlayableChar.new(
	preload("res://src/characters/base_player/knight/knight.tscn"),
	preload("res://src/characters/base_player/knight/knight_stats.gd"),
	preload("res://src/characters/base_player/knight/knight.gd")
)
var archer = PlayableChar.new(
	preload("res://src/characters/base_player/archer/archer.tscn"),
	preload("res://src/characters/base_player/archer/archer_stats.gd"),
	preload("res://src/characters/base_player/archer/archer.gd")
)

var mage = PlayableChar.new(
	preload("res://src/characters/base_player/mage/mage.tscn"),
	preload("res://src/characters/base_player/mage/mage_stats.gd"),
	preload("res://src/characters/base_player/mage/mage.gd")
)

onready var player_class = knight
onready var icon = get_node("VBoxContainer/TextureRect")

func _on_KnightButton_pressed():
	player_class = knight
	icon.texture = load("res://assets/textures/knight/knight24.png")
	icon.flip_h = false


func _on_ArcherButton_pressed():
	player_class = archer
	icon.texture = load("res://assets/textures/archer/archer24.png")
	icon.flip_h = true


func _on_start_button_pressed():
	var player = player_class.scene.instance()
	player.name = "player"
	get_tree().get_root().get_node("Game").load_level(player)#im not sure we can remove get_node from here


func _on_MageButton_pressed():
	player_class = mage
	icon.texture = load("res://assets/textures/mage/mage_run_side1.png")
	icon.flip_h = false
