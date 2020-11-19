extends Node2D

var cloud = preload("res://src/levels/sky/Cloud.tscn")
var size = 10000
var speed = [10, 20]
var spacing = [400, 600]
var scaling = [3, 6]
var opacity = [0.15, 0.25]

onready var timer = $Spawn_timer
onready var spawner = $Spawner

func _ready():
	randomize()
	rotation_degrees = 360 / 8 * (randi() % 8)
	_on_timeout()
	__init()


func __init():
	var x = -size / 2
	while x < size / 2:
		spawn_clouds(x)
		x += rand_range(spacing[0], spacing[1])


func _on_timeout():
	timer.start(rand_range(spacing[1] / speed[0], spacing[0] / speed[1]) / 60)
	spawn_clouds(-size / 2)


func spawn_clouds(x):
	var y = -size / 2
	while y < size / 2:
		instance_cloud(Vector2(x, y))
		y += rand_range(spacing[0], spacing[1])


func instance_cloud(_position):
	var cloud_instance = cloud.instance()
	cloud_instance.position = Vector2.ZERO
	cloud_instance.global_position = global_position + _position.rotated(rotation)
	cloud_instance.direction = Vector2.RIGHT.rotated(rotation)
	cloud_instance.max_range = size
	cloud_instance.velocity = rand_range(speed[0], speed[1])
	cloud_instance.scaling = scaling
	cloud_instance.opacity = opacity
	get_parent().call_deferred("add_child", cloud_instance)
