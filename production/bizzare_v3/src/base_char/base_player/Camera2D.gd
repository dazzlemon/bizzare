extends Camera2D

#onready var ui_node = get_node("../CanvasLayer")

#var radius_required_to_move = 10
var sensetivity = 0.3
var distance
var direction
var _offset : Vector2 = Vector2(0,135)
onready var parent = get_parent()

func _process(delta):
	var mouse_position = get_global_mouse_position()#
	direction = (mouse_position - parent.global_position).normalized()
	distance = global_position.distance_to(mouse_position) 
	#print(direction)
	#distance = clamp(distance, 0 , 150) 
	print(distance)
	global_position = parent.global_position + direction * distance * sensetivity
	#print(direction * distance)
