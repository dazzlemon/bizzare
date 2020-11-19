extends Node2D

onready var sprite = $Sprite
var velocity
var direction
var max_range 

func _ready():
	sprite.rotation = 360/4 * (randi()%4)
	sprite.scale *= rand_range(1, 2)
	velocity = rand_range(30, 60)#3,6
	sprite.modulate.a = rand_range(0.28, 0.36)
	sprite.frame = randi()%4


func _process(delta):
	position += velocity * delta * direction
	if position.length() >= max_range:
		queue_free()
