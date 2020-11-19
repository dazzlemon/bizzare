extends Node2D

onready var sprite = $Sprite
var velocity
var direction
var max_range

var scaling = [3, 6]
var opacity = [0.15, 0.25]

var offset = Vector2.ZERO

func _ready():
	sprite.rotation_degrees = 360 / 4 * (randi() % 4)
	sprite.frame = randi() % 4
	sprite.scale *= rand_range(scaling[0], scaling[1])
	sprite.modulate.a = rand_range(opacity[0], opacity[1])


func _process(delta):
	offset += velocity * delta * direction#i had to make my own offset because godot's devs didnt
	position += velocity * delta * direction
	if offset.length() >= max_range:
		queue_free()
