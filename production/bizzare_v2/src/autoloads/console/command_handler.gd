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
	["no_clip", []],
]


func set_value(_name, value):
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	var stats = player.get_node("stats")
	value[0] = float(value[0])
	stats[_name] = value[0]
	return str ("Successfully set " + _name + " to ", value[0])


func no_clip():
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	player.get_node("collision_box").disabled = not player.get_node("collision_box").disabled
	return str ("No clip - " + str(player.get_node("collision_box").disabled))


func clear():
	var output = get_node("../").output
	output.select_all()
	output.cut()
	output.set_line(0, " Debug console")
	return str("")
	
