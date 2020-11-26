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

func health(value):
	return set_value("health", value)	


func max_health(value):
	return set_value("max_health", value)


func armor(value):
	return set_value("armor", value)


func max_armor(value):
	return set_value("max_armor", value)


func damage(value):
	return set_value("damage", value)


func set_value(_name, value):
	value = float(value)
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	var stats = player.get_node("stats")
	stats[_name] = value
	return str ("Successfully set " + _name + " to ", value)

func clear():
	var output = get_node("../").output
	output.select_all()
	output.cut()
	output.set_line(0, " Debug console")
	return str("")
	
