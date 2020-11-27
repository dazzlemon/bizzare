extends Control


enum{
	INT,
	STRING,
	BOOL,
	FLOAT,
}

const commands = [
	["health", [FLOAT]],
	["armor", [FLOAT]],
	["max_health", [FLOAT]],
	["max_armor", [FLOAT]],
	["damage", [FLOAT]],
	["clear", []],
]


func set_value(_name, value):
	value[0] = float(value[0])
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	var stats = player.get_node("stats")
	stats[_name] = value[0]
	return str ("Successfully set " + _name + " to ", value[0])


func clear():
	var output = get_node("../").output
	output.select_all()
	output.cut()
	output.set_line(0, " Debug console")
	return str("")
	
