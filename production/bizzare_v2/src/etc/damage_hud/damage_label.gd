class_name DMGLabel
extends Label

onready var stats = get_node("../../../stats")

func _process(delta):
	set_text(str(stats.damage))
