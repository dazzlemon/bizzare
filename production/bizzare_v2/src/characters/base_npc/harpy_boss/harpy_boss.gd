class_name HarpyBoss
extends BaseNPC

onready var game_over = load("res://src/Menus/Game_Over/Game_Over.tscn")

func die():
	var GO_instance = game_over.instance()
	GO_instance.get_node("boss_defeated").visible = true
	get_tree().get_root().get_node("Game").add_child(GO_instance)
	.die()
	
