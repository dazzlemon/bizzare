extends Panel

var player_class  

enum player_classes {
	KNIGHT,
	ARCHER,
}

const player_classes_dict = {
	player_classes.KNIGHT : "res://src/characters/base_player/knight/knight.tscn",
	player_classes.ARCHER : "res://src/characters/base_player/archer/archer.tscn",
}

onready var profile_image= get_node("MarginContainer/HBoxContainer/CenterContainer/TextureRect")
onready var class_type = get_node("MarginContainer/HBoxContainer/VBoxContainer/Class/Data")
onready var health = get_node("MarginContainer/HBoxContainer/VBoxContainer/Health/Data")
onready var armor = get_node("MarginContainer/HBoxContainer/VBoxContainer/Armor/Data")
onready var speed = get_node("MarginContainer/HBoxContainer/VBoxContainer/Speed/Data")
onready var damage = get_node("MarginContainer/HBoxContainer/VBoxContainer/Damage/Data")

func _ready():
	var class_data = load("res://src/Menus/character_choise/knight_profile.tres")
	update_class_display(class_data)


func update_class_display(class_data):
	profile_image.texture = class_data.image
	class_type.text = class_data.class_type
	health.text = str(class_data.health)
	armor.text = str(class_data.armor)
	speed.text = str(class_data.speed)
	damage.text = str(class_data.damage)


func _on_KnightButton_pressed():
	var class_data = load("res://src/Menus/character_choise/knight_profile.tres")
	update_class_display(class_data)
	player_class = player_classes.KNIGHT


func _on_ArcherButton_pressed():
	var class_data = load("res://src/Menus/character_choise/archer_profile.tres")
	update_class_display(class_data)
	player_class = player_classes.ARCHER


func _on_start_button_pressed():
#	var level = load("res://src/levels/world_test_level.tscn")
#	level.add_child(load(player_classes_dict[player_class]))
#	get_tree().get_root().add_child(level)
	pass
