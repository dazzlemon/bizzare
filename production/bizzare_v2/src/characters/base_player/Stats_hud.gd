extends RichTextLabel

onready var player = get_node("../../")
onready var stats = player.get_node("stats")

func _process(_delta) -> void:
	set_text("Class:" + str(Utility.get_typeof(player)) + "\n".c_unescape())
	add_text("fps:" + str(Engine.get_frames_per_second()))
