extends Label

onready var stats = get_node("../../../stats")
onready var parent = get_parent()

func _process(delta):
	set_text(str(stepify(stats.get(parent.value_str), 0.1)) + "/" + str(stats.get(parent.max_value_str)))
