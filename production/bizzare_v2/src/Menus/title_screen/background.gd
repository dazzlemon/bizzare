class_name TitleScreenBackGround
extends Node2D

signal instance_next

var speed = 300
var direction = Vector2.LEFT
var scene = load("res://src/levels/title_screen_level.tscn")

onready var tilemap = get_node("Grass_24_shadow")
onready var width = calculate_width(tilemap)
onready var viewport_width = get_viewport_rect().size.x + 60

func _process(delta):
	if -global_position.x >= width - viewport_width:
		emit_signal("instance_next")
	global_position += speed * delta * direction
	if -global_position.x >= width + 100:
		queue_free()


func calculate_width(tilemap):
	var ctp = tilemap_cell_to_pix_trans(tilemap)
	var cell_bounds = tilemap.get_used_rect()
	return (ctp * cell_bounds.size).x


func tilemap_cell_to_pix_trans(tilemap):
	var x = Vector2(tilemap.cell_size.x * tilemap.scale.x, 0)
	var y = Vector2(0, tilemap.cell_size.y * tilemap.scale.y)
	var origin = Vector2.ZERO
	return Transform2D(x, y, origin)


func instance():
	var instance = scene.instance()
	instance.global_position.x = viewport_width - 24#-24, so last column overlaps first
	get_node("../").call_deferred("add_child", instance)
