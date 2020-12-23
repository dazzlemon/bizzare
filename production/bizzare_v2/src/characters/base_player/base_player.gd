#WIP
class_name BasePlayer 
extends BaseChar

onready var walk_audio_stream = $Sound/walk
onready var game_over = load("res://src/Menus/Game_Over/Game_Over.tscn")

func _process(delta):
	walk_audio_stream.stream_paused = velocity == Vector2.ZERO

func die():
	var GO_instance = game_over.instance()
	GO_instance._text = "GAME\nOVER" 
	get_tree().get_root().get_node("Game").add_child(GO_instance)
	.die()
