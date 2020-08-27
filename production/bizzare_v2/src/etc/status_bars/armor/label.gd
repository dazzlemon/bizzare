extends RichTextLabel

onready var stats = get_node("../../../stats")

func _process(delta):
	set_text(str(stats.armor) + "/" + str(stats.max_armor))
