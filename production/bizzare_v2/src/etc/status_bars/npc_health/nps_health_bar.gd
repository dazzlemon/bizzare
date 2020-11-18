class_name NPCHealthBar
extends StatusBar

var color_map = {
	Color(Color.indianred) : 0.1,
	Color(Color.orange) : 0.25,
	Color(Color.gold) : 0.5,
	Color(Color.yellowgreen) : 0.9,
}

func _process(delta):
	assign_color()
	._process(delta)
	

func _ready():
	max_value_str = "max_health"
	value_str = "health"
	._ready()

func assign_color():
	for color in color_map:
		if stats.health < status_bar.max_value * color_map[color]:
			status_bar.tint_progress = color
			break
