extends Control

export(NodePath) var camera_node
export(Dictionary) var cell_colors
export var zoom = 4


onready var camera  = get_node(camera_node)
var tilemap_nodes : Array = [ "../../../../../Grass_24_shadow/leaf_wall" ] 
var tilemaps = []
var temp = Vector2(0,0)

var fixed_toggle_point = Vector2(0,0)
var currently_moving_map = false


func _ready():
	for node in tilemap_nodes:
		tilemaps.append(get_node(node))
	temp = rect_position


func try_use():
	visible = not visible


func get_cells(tilemap : TileMap, id):
	return tilemap.get_used_cells_by_id(id)


func _draw():
	draw_set_transform(rect_size / 2, 0, Vector2.ONE)
	for tilemap in tilemaps:
		var camera_position = camera.position#camera.get_camera_screen_center()
		var camera_cell = tilemap.world_to_map(camera_position)
		var tilemap_offset = camera_cell + (camera_position - tilemap.map_to_world(camera_cell)) / tilemap.cell_size
		for id in cell_colors.keys():
			var color = cell_colors[id]
			var cells = get_cells(tilemap, id)
			for cell in cells:
				draw_rect(Rect2((cell - tilemap_offset) * zoom , Vector2.ONE * zoom), color)


func _process(delta):
	if Input.is_action_just_pressed("minimap"):
		visible = not visible
	if get_tree().paused:
		visible = false
		
	update()
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		if(!currently_moving_map):
			var ref = get_viewport().get_mouse_position()
			fixed_toggle_point = ref
			currently_moving_map = true
		move_map_around()
	else:
		currently_moving_map = false
	#print(rect_position)


func _input(event):
	if visible:
		if event is InputEventMouseButton and event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP and zoom <= 8:
				zoom += 1
			if event.button_index == BUTTON_WHEEL_DOWN and zoom > 1:
				zoom -= 1 


func move_map_around(): 
	var ref = get_viewport().get_mouse_position()
	rect_position.x -= (ref.x - fixed_toggle_point.x)
	rect_position.x = clamp(rect_position.x, temp.x - 200, temp.x + 200)
	rect_position.y -= (ref.y - fixed_toggle_point.y)
	rect_position.y = clamp(rect_position.y, temp.y - 200, temp.y + 200)
	fixed_toggle_point = ref

