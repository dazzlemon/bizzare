class_name Spell2CDHUD
extends TextureProgress

var number = 2
onready var timer = get_node("../../../spell_" + str(number) + "/cd")

func _ready():
	if timer != null:
		max_value = timer.wait_time
		min_value = 0
		value = max_value
		step = max_value / 360


func _process(delta):
	if timer != null:
		value = timer.wait_time - timer.get_time_left()
	
