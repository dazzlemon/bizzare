extends RichTextLabel

onready var stats = get_node("../../../stats")

func _process(delta):
	set_text(str(stepify(stats.armor, 0.1)) + "/" + str(stats.max_armor))
