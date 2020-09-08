extends RichTextLabel

var class_type = "knight"
var health = 0
var armor = 0
var speed = 0
var damage = 0

onready var character_choice = get_parent()

func _process(delta):
	var player_stats = character_choice.player_class.stats_script.new()
	player_stats._ready()  #RABOTAET CHEREZ 04ko
	
	var player_scene = character_choice.player_class.scene.instance()
	set_text(("%-15s" % "\tclass:" + "%5s" % Utility.get_typeof(player_scene) + "\n").c_unescape())
	player_scene.free()
	
	add_text(("%-15s" % "\thealth:" + "%5d" % player_stats.max_health + "\n").c_unescape()) ##FONT PROBLEMS
	add_text(("%-15s" % "\tarmor:" + "%4s" % player_stats.max_armor + "\n").c_unescape())
	
	var player_script = character_choice.player_class.scene_script.new()
	player_script._ready()
	add_text(("%-15s" % "\tspeed:" + "%5d" % player_script.MAX_SPEED + "\n").c_unescape())
	player_script.free()
	
	add_text(("%-15s" % "\tdamage:" + "%4s" % player_stats.damage + "\n").c_unescape())
	player_stats.free()
