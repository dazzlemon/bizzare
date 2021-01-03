class_name RoomGenerator
extends Node2D

var rng  = RandomNumberGenerator.new()
const rooms_size = Vector2(5,5)

class Room:
	var _position = Vector2.ZERO
	var open_dirs  = []

	func _init(_bool_arr):
		open_dirs = _bool_arr 


var room_variants = [
	[true,false,false,false], #1 enter
	[false,true,false,false],
	[false,false,true,false],
	[false,false,false,true],
	
	[true,false,true,false], #2 entres
	[true,false,false,true],
	[false,true,true,false],
	[false,true,false,true],
	[true,true,false,false],
	[false,false,true,true],
	
	[true,true,true,false], #3 entres
	[false,true,true,true],
	[true,false,true,true],
	[true,true,false,true],
	
	[true,true,true,true], #4 entres
]

 #Vector2 : bool_arr[ , , , ]

	

func _ready():
	randomize()
	#seed(10)
	generate(20)


func generate(room_count):
	var spawned_rooms = {Vector2.ZERO : Room.new(room_variants[14])}
	spawn_room(Vector2.ZERO * rooms_size * 24,spawned_rooms[Vector2.ZERO].open_dirs)
	var open_rooms = []
	while room_count > 0:
		
		for room in spawned_rooms.values():
			if room.open_dirs[0] or room.open_dirs[1] or room.open_dirs[2] or room.open_dirs[3]:
				open_rooms.append(room)
		if open_rooms.size() == 0:
			print("All rooms are closed" + str(room_count))
			return
		open_rooms.shuffle()
		var rand_open_room = open_rooms[0]
		var rand_open_room_position = rand_open_room._position #Pick random open-ended room 


		var valid_directions = []
		if rand_open_room.open_dirs[0]:
			valid_directions.append(Vector2.UP)
		if rand_open_room.open_dirs[1]:
			valid_directions.append(Vector2.DOWN)
		if rand_open_room.open_dirs[2]:
			valid_directions.append(Vector2.LEFT)
		if rand_open_room.open_dirs[3]:
			valid_directions.append(Vector2.RIGHT)
		valid_directions.shuffle()
		
		var added_room_position = rand_open_room_position + valid_directions[0] #position of added room

		var has_room_nearby = [
		spawned_rooms.has(added_room_position + Vector2.UP),
		spawned_rooms.has(added_room_position + Vector2.DOWN),
		spawned_rooms.has(added_room_position + Vector2.LEFT), 
		spawned_rooms.has(added_room_position + Vector2.RIGHT)
		]
		
		var required_path = [
		has_room_nearby[0] and spawned_rooms[added_room_position + Vector2.UP].open_dirs[1],
		has_room_nearby[1] and spawned_rooms[added_room_position + Vector2.DOWN].open_dirs[0],
		has_room_nearby[2] and spawned_rooms[added_room_position + Vector2.LEFT].open_dirs[3], 
		has_room_nearby[3] and spawned_rooms[added_room_position + Vector2.RIGHT].open_dirs[2] 
		]
		
		var blocked_paths = [
		has_room_nearby[0] and not spawned_rooms[added_room_position + Vector2.UP].open_dirs[1],
		has_room_nearby[1] and not spawned_rooms[added_room_position + Vector2.DOWN].open_dirs[0] ,
		has_room_nearby[2] and not spawned_rooms[added_room_position + Vector2.LEFT].open_dirs[3] , 
		has_room_nearby[3] and not spawned_rooms[added_room_position + Vector2.RIGHT].open_dirs[2]
		]


		var valid_rooms_to_add = []
		for room in room_variants:
			var is_room_valid = true
			if (required_path[0] and room[0] == false) or (required_path[1] and room[1] == false) or (required_path[2] and room[2] == false) or (required_path[3] and room[3] == false):
				is_room_valid = false 
			if (blocked_paths[0] and room[0] == true) or (blocked_paths[1] and room[1] == true) or (blocked_paths[2] and room[2] == true) or (blocked_paths[3] and room[3] == true):
				is_room_valid = false 
			if is_room_valid:
				valid_rooms_to_add.append(room)
		valid_rooms_to_add.shuffle()
		var room_to_add = Room.new(valid_rooms_to_add[0])
		room_to_add._position = added_room_position #adding room
		#Spawning + cutting room
		spawn_room(added_room_position * rooms_size, room_to_add.open_dirs)

		if required_path[0]:
			room_to_add.open_dirs[0] = false
			spawned_rooms[added_room_position + Vector2.UP].open_dirs[1] = false
			#print(spawned_rooms[added_room_position + Vector2.UP].open_dirs[1])
		if required_path[1]:
			room_to_add.open_dirs[1] = false
			spawned_rooms[added_room_position + Vector2.DOWN].open_dirs[0] = false
		if required_path[2]:
			room_to_add.open_dirs[2] = false
			spawned_rooms[added_room_position + Vector2.LEFT].open_dirs[3] = false
		if required_path[3]:
			room_to_add.open_dirs[3] = false
			spawned_rooms[added_room_position + Vector2.RIGHT].open_dirs[2] = false #Closing all opeenings
		print(room_to_add.open_dirs)
		spawned_rooms[added_room_position] = room_to_add
		open_rooms.clear()
		room_count -= 1


func spawn_room(_position, cutout_directions):
	var room = load("res://src/levels/room.tscn")
	#var wall_tiles = get_node("YSort/bush_wall")
	var room_instance = room.instance()
	if cutout_directions[0] == true:	
		room_instance.get_node("YSort/bush_wall").set_cell(2,0,-1)
	if cutout_directions[1] == true:	
		room_instance.get_node("YSort/bush_wall").set_cell(2,4,-1)
		#room_instance.get_node("YSort/bush_wall").update_bitmask_region(Vector2(0,0) , Vector2(5,5))
	if cutout_directions[2] == true:	
		room_instance.get_node("YSort/bush_wall").set_cell(0,2,-1)
		#room_instance.get_node("YSort/bush_wall").update_bitmask_region(Vector2(0,0) , Vector2(5,5))
	if cutout_directions[3] == true:	
		room_instance.get_node("YSort/bush_wall").set_cell(4,2,-1)
		#room_instance.get_node("YSort/bush_wall").update_bitmask_region(Vector2(0,0) , Vector2(5,5))
	room_instance.position = _position * 24
	
	call_deferred("add_child",room_instance)
	#room_instance.get_node("YSort/bush_wall").update_bitmask_region(Vector2(0,0) , Vector2(5,5))
	





