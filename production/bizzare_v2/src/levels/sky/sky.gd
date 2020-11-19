extends Node2D

var cloud = preload("res://src/levels/sky/Cloud.tscn")
var size = 1000

onready var timer = $Spawn_timer
onready var spawner = $Spawner

func _ready():
	randomize()
	rotation_degrees = 360 / 8 * (randi() % 8)
	_on_timeout()


func _on_timeout():
	timer.start(rand_range(0.3, 0.5))#(15, 20))
	spawn_clouds()


func spawn_clouds():
	var _position = 0
	while _position < size:
		instance_cloud(_position)
		_position += rand_range(100 ,200)


func instance_cloud(_position):
	var cloud_instance = cloud.instance()
	cloud_instance.position = Vector2.ZERO
	cloud_instance.global_position = global_position + Vector2(-size / 2, _position).rotated(rotation)
	cloud_instance.direction = Vector2.RIGHT.rotated(rotation)
	cloud_instance.max_range = size
	get_parent().call_deferred("add_child", cloud_instance)
