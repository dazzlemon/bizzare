extends Panel

class PlayableChar:
	var scene
	var scene_script 

	func _init(scene, scene_script):
		self.scene = scene
		self.scene_script = scene_script

var knight = PlayableChar.new(
	preload("res://src/base_char/base_player/knight/knight.tscn"),
	preload("res://src/base_char/base_player/base_player.gd")
	)

var archer = PlayableChar.new(
	preload("res://src/base_char/base_player/archer/archer.tscn"), 
	preload("res://src/base_char/base_player/base_player.gd")
)

var mage = PlayableChar.new(
	preload("res://src/base_char/base_player/mage/mage.tscn"),
	preload("res://src/base_char/base_player/base_player.gd")
)

onready var player_class = knight
onready var icon = get_node("VBoxContainer/TextureRect")


func _change_class(class_str):
	var _class = .get(class_str)
	player_class = _class
	print(player_class)


func _on_play_pressed():
	var player = player_class.scene.instance()
	player.name = "player"
	get_tree().get_root().get_node("Game").load_level(player)#im not sure we can remove get_node from here
