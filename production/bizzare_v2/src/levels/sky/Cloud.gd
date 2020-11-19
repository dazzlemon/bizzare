extends Node2D

onready var sprite = $Sprite
var velocity
var direction
var max_range

var offset = Vector2.ZERO

func _ready():
	velocity = rand_range(300, 600)#(3, 6)
	
	sprite.rotation_degrees = 360 / 4 * (randi() % 4)
	sprite.scale *= rand_range(1, 2)
	sprite.modulate.a = rand_range(0.28, 0.36)
	sprite.frame = randi() % 4


func _process(delta):
	offset += velocity * delta * direction#i had to make my own offset because godot's devs didnt
	position += velocity * delta * direction
	if offset.length() >= max_range:
		queue_free()
