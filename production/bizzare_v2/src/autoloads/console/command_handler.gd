extends Control


enum{
	INT,
	STRING,
	BOOL,
	FLOAT,
}

const commands = [
	["set_health", [FLOAT]],
	["set_armor", [FLOAT]],
]

func set_health(health):
	health = float(health)
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	var stats = player.get_node("stats")
	stats.health = health
	return str ("Successfully set health to ", health)


func set_armor(armor):
	armor = float(armor)
	var player = get_tree().get_root().get_node("Game/level/Trees/YSort/player")
	var stats = player.get_node("stats")
	stats.armor = armor
	return str ("Successfully set armor to ", armor)
