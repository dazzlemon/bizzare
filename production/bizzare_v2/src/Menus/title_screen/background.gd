class_name TitleScreenBackGround
extends Node2D

var speed = 30
var direction : Vector2 = Vector2.LEFT
onready var tilemap = get_node("Grass_24_shadow")
var size
var checker = true
var scene = load ("res://src/levels/title_screen_level.tscn")

func _ready():
	calculate_size(tilemap)


func _process(delta):
	global_position += speed * delta * direction
	if checker :
		instance()
	if -global_position.x >= size.size[0] + 100:
		queue_free()

func calculate_size(tilemap):
	var cell_bounds = tilemap.get_used_rect()
	var cell_to_pixel = Transform2D(Vector2(tilemap.cell_size.x * tilemap.scale.x, 0), Vector2(0, tilemap.cell_size.y * tilemap.scale.y), Vector2())
	size = Rect2(cell_to_pixel * cell_bounds.position, cell_to_pixel * cell_bounds.size)
	
	
func instance():
	
	if -global_position.x >= size.size[0] - 540:
		checker = false
		var instance = scene.instance()
		instance.global_position = Vector2(516,0) ##############################IDK WHY 516 , Seems like razrab nasral #########NEED TO BE 504
		get_node("../").call_deferred("add_child", instance)
		
