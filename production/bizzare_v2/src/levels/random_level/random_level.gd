extends Node2D

const WALL_SIZES = Vector2(19, 20)
const _transform = Transform2D(
	Vector2(WALL_SIZES.x, 0),
	Vector2(0, WALL_SIZES.y),
	Vector2.ZERO
	)

const dirs = {"N" : 1, "S" : 2, "E" : 4, "W" : 8}
const DX = {"E" : 1, "W" : -1, "N" : 0, "S" : 0}
const DY = {"E" : 0, "W" :  0, "N" : -1, "S" : 1}
const OPPOSITE = {"E" : "W", "W" : "E", "N" : "S", "S" : "N"}

var width = 10
var height = 10
var _seed = 10

onready var wall = $Grass_24_shadow/leaf_wall
onready var path = $Grass_24_shadow/path
onready var grass = $Grass_24_shadow

onready var foliage = {
	$Grass_24_shadow/flowers_grass : [0.5, [0]],
	$Trees/YSort/bush : [0.01, [0]],
	$Trees : [0.01, [0]],
	$Trees/YSort/fallen_tree : [0.01, [0]],
}

func _ready():
	seed(_seed)
	_generate()


func _generate():
	var grid = _array2d(height, width)
	carve_passages_from(0, 0, grid)
	_print(grid)
	_set_walls(grid)


func _array2d(heigth, width):
	var array2d := []
	for i in range(height):
		array2d.append([])
		array2d[i] = []
		for j in range(width):
			array2d[i].append([])
			array2d[i][j] = 0
	return array2d


func carve_passages_from(cx, cy, grid):
	var directions = dirs.keys()
	directions.shuffle()
	for d in directions:
		var nx = cx + DX[d]
		var ny = cy + DY[d]
		if (ny >= 0 and ny <= grid.size()-1) and (nx >= 0 and nx <= grid[ny].size()-1) and grid[ny][nx] == 0:
			grid[cy][cx] |= dirs[d]
			grid[ny][nx] |= dirs[OPPOSITE[d]]
			carve_passages_from(nx, ny, grid)


func _set_walls(grid):
	for y in range(height):
		for x in range(width):
			_set_room(x, y, grid)
	wall.update_bitmask_region()


func _set_room(x, y, grid):
	var _position = Vector2(x, y)
	for i in range(2):
		_begin_wall(_position, i)
		_next_wall(_position, grid[y][x], i)
	var start = Vector2(x * WALL_SIZES.x, y * WALL_SIZES.y)
	var end = Vector2((x + 1) * WALL_SIZES.x + 1, (y + 1) * WALL_SIZES.y + 1)
	_tile_rect(grass, start, end, 0)
	_paths(x, y, grid)
	grass.update_bitmask_region()
	
	for i in range(start.x, end.x, 1):
		for j in range(start.y, end.y, 1):
			_foliage(Vector2(i, j))
	for f in foliage:
		f.update_bitmask_region()

func _paths(x, y, grid):
	var d = [int(not bool(int(WALL_SIZES.x) % 2)),
			int(not bool(int(WALL_SIZES.y) % 2))]
	var size = [2 + d[0], 2 + d[1]]
	var axis = [x, y]                                                                                               
	
	for z in range(4):
		var c = int(z > 1)
		var nc = int(not bool(c))
		if grid[y][x] & dirs.values()[z]:
			var start = Vector2(
				(axis[c] + 0.5) * WALL_SIZES[c] - d[c],
				(axis[nc] + 0.5 * int(z if nc else not bool(z - 2))) * WALL_SIZES[nc])
			var end = Vector2(
				start.x + size[c],
				start.y + 0.5 * WALL_SIZES[nc] + size[nc] - d[nc])
			var s = Vector2(start[c], start[nc])
			var e = Vector2(end[c], end[nc])
			_tile_rect(grass, s, e, -1)
			_tile_rect(path, s, e, 1)


func _foliage(_position):
	if grass.get_cellv(_position) != TileMap.INVALID_CELL:
		var roll = randf()
		print(roll)
		var counter = 0
		for f in foliage:
			counter += foliage[f][0]
			if roll <= counter:
				f.set_cellv(_position, foliage[f][1][randi() % foliage[f][1].size()])
				break


func _tile_rect(tilemap, start: Vector2, end: Vector2, val):
	for i in range(start.x, end.x, 1):
		for j in range(start.y, end.y, 1):
			tilemap.set_cellv(Vector2(i, j), val)

func _next_wall(_position, cell, axis):
	var raxis = int(not bool(axis))
	var direction = dirs.keys()[1 + raxis]
	var dir_vec = Vector2.RIGHT.rotated(axis * - 3 * PI / 2)#not (PI / 2), because else it returns Vector2(-0, 2) and causes certain cell to not spawn(voprosi k godotu)
	if bool(cell & dirs[direction]):
		_empty_wall(_position + dir_vec, raxis)
	else:
		_wall(_position + dir_vec, raxis)


func _empty_wall(start, axis):
	start = _transform.xform(start)
	var i = Vector2.ZERO
	while i.length() < WALL_SIZES[axis] / 2 - 1:
		wall.set_cellv(start + i, 0)
		i[axis] += 1
	
	i[axis] += 2 + int(not bool(int(WALL_SIZES[axis]) % 2))
	
	while i.length() <= WALL_SIZES[axis]:
		wall.set_cellv(start + i, 0)
		i[axis] += 1


func _begin_wall(_position, axis):
	if not bool(_position[axis]):
		_wall(_position, int(not bool(axis)))


func _wall(start: Vector2, axis: int):
	#axis 0 - x or 1 - y
	start = _transform.xform(start)
	var i = Vector2.ZERO
	while i.length() <= WALL_SIZES[axis]:
		wall.set_cellv(start + i, 0)
		i[axis] += 1


func _print(grid):
	var str_ = " "
	for _i in range(width * 2 - 1):
		str_ += "_"
	str_ += "\n"
	for y in range(height):
		str_ += "|"
		for x in range(width):
			str_ += " " if bool(grid[y][x] & dirs["S"]) else "_"
			if bool(grid[y][x] & dirs["E"]):
				str_ += " " if bool((grid[y][x] | grid[y][x+1]) & dirs["S"]) else "_"
			else:
				str_ += "|"
		str_ += "\n"
	print(str_)
	print("width = " + str(width))
	print("height = " + str(height))
	print("seed = " + str(_seed))
