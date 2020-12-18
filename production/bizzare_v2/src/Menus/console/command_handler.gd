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
	["spawn",[STRING]],
]

var mobs = {
	preload("res://src/characters/base_npc/harpy/harpy.tscn") : "harpy",
	#preload("res://src/characters/base_npc/harpy_boss/harpy_boss.tscn") : "harpy_boss",  #IDK why it crash on phase attack
	preload("res://src/characters/base_npc/Slime/slime.tscn") : "slime",
	preload("res://src/characters/base_npc/orc_melee/orc_melee.tscn") : "orc_melee",
	preload("res://src/characters/base_npc/orc_range/orc_range.tscn") : "orc_range",
	preload("res://src/characters/base_npc/shadow/shadow.tscn") : "shadow",
}



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
	
func spawn(url):
	for mob in mobs:
		if url == mobs[mob]:
			var instance = mob.instance()
			instance.global_position = get_tree().get_root().get_node("Game/level/Trees/YSort/player").global_position + Vector2(20,20)
			get_tree().get_root().get_node("Game/level/Trees/YSort").call_deferred("add_child", instance)
	return str("")
