class_name NPCHealthBar
extends StatusBar

var full_hp_color = Color( 0.2, 0.8, 0.2, 1 ) #limegreen
var almost_full_hp_color = Color( 0.68, 1, 0.18, 1 ) #greenyellow
var half_hp_color = Color( 1, 0.84, 0, 1 )  # gold
var low_hp_color = Color( 1, 0.27, 0, 1 ) #Orangered
var very_low_hp_color = Color ("#cc2e2e") #red

export (float , 0, 1, 0.05) var almost_full_hp = 0.9
export (float , 0, 1, 0.05) var half_hp = 0.5
export (float , 0, 1, 0.05) var low_hp = 0.25
export (float , 0, 1, 0.05) var very_low_hp = 0.15

func _process(delta):
	._process(delta)
	assign_color()

func _ready():
	stats = get_node("../stats")
	status_bar.max_value = stats.max_health
	status_bar.tint_progress = full_hp_color

func assign_color():
	if stats.health < status_bar.max_value * almost_full_hp:
		status_bar.tint_progress = almost_full_hp_color
	elif stats.health < status_bar.max_value * half_hp:
		status_bar.tint_progress = half_hp_color
	elif stats.health < status_bar.max_value * low_hp:
		status_bar.tint_progress = very_low_hp_color
	elif stats.health < status_bar.max_value * very_low_hp:
		status_bar.tint_progress = very_low_hp_color
