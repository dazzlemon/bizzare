class_name TitleScreenBackGround
extends Node2D

var speed = 10
var direction : Vector2 = Vector2.LEFT


func _process(delta):
	global_position += speed * delta * direction
	print(global_position)
