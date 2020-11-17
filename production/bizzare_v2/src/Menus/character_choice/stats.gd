extends RichTextLabel

var class_type = "knight"

onready var character_choice = get_parent()

func _process(delta):
	print_stats(get_stats())


func print_stats(stats):
	set_text("")
	for k in stats:
		add_text(_str(k, stats[k]))


func get_stats():
	var player_stats = character_choice.player_class.stats_script.new()
	player_stats._ready()
	var stats = {
		"class" : _get_typeof_player(),
		"health" : player_stats.max_health,
		"armor" : player_stats.max_armor,
		"speed" : _get_speed(),
		"damage" : player_stats.damage,
		}
	player_stats.free()
	return stats


func _get_typeof_player():
	var player_scene = character_choice.player_class.scene.instance()
	var ret = Utility.get_typeof(player_scene)
	player_scene.free()
	return ret


func _get_speed():
	var player_script = character_choice.player_class.scene_script.new()
	player_script._ready()
	var ret = player_script.MAX_SPEED
	player_script.free()
	return ret


func _str(_name, val):
	return ("%-10s" % ("\t" + _name) + "%6s" % val + "\n").c_unescape()
