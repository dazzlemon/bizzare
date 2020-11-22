extends Node2D

onready var wall = $Grass_24_shadow/leaf_wall

const WALL_SIZES = Vector2(20, 20)

const dirs = {"N" : 1, "S" : 2, "E" : 4, "W" : 8}
const DX = {"E" : 1, "W" : -1, "N" : 0, "S" : 0}
const DY = {"E" : 0, "W" :  0, "N" : -1, "S" : 1}
const OPPOSITE = {"E" : "W", "W" : "E", "N" : "S", "S" : "N"}

var width = 10
var height = 10
var _seed = 10

const _transform = Transform2D(
	Vector2(WALL_SIZES.x, 0),
	Vector2(0, WALL_SIZES.y),
	Vector2.ZERO
	)

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
	for i in range(width):
		_horizontal_wall(Vector2(i, 0))
	for y in range(0, height, 1):
		_vertical_wall(Vector2(0, y))
		for x in range(0, width, 1):
			if not bool(grid[y][x] & dirs["S"]):
				_horizontal_wall(Vector2(x, y + 1))
			if bool(grid[y][x] & dirs["E"]):
				if not bool((grid[y][x] | grid[y][x+1]) & dirs["S"]):
					_horizontal_wall(Vector2(x + 1, y + 1))
			else:
				_vertical_wall(Vector2(x + 1, y))
	wall.update_bitmask_region(Vector2.ZERO, Vector2(WALL_SIZES.x * width, WALL_SIZES.y * height))


func _vertical_wall(start: Vector2):
	start = _transform.xform(start)
	
	for i in range(WALL_SIZES.y + 1):
		wall.set_cellv(start + Vector2(0, i), 0)


func _horizontal_wall(start: Vector2):
	start = _transform.xform(start)
	
	for i in range(WALL_SIZES.x + 1):
		wall.set_cellv(start + Vector2(i, 0), 0)


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
