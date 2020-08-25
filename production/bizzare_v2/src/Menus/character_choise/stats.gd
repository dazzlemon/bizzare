extends RichTextLabel

var class_type = "knight"
var health = 0
var armor = 0
var speed = 0
var damage = 0


onready var character_choice = get_node("../")
onready var player_stats = load(character_choice.player_classes_dict[character_choice.player_class][1]).new()


func _process(delta):
	player_stats.queue_free()
	player_stats = load(character_choice.player_classes_dict[character_choice.player_class][1]).new()#RABOTAET CHEREZ 04ko
	player_stats._ready()  #RABOTAET CHEREZ 04ko
	set_text(("%-15s" % "\tclass" + "\n").c_unescape())#knight is tmp
	add_text(("%-15s" % "\thealth" + "%5d" % player_stats.max_health + "\n").c_unescape()) ##FONT PROBLEMS
	add_text(("%-15s" % "\tarmor" + "%5d" % player_stats.max_armor + "\n").c_unescape())
	add_text(("%-15s" % "\tspeed" + "\n").c_unescape())
	add_text(("%-15s" % "\tdamage" + "%5s" % player_stats.damage + "\n").c_unescape())
