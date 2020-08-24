extends RichTextLabel

var class_type = "knight"
var health = 0
var armor = 0
var speed = 0
var damage = 0

func _process(delta):
	set_text("class		" + "knight" + "\n".c_unescape())#knight is tmp
	add_text("health	" + "0" + "\n".c_unescape())
	add_text("armor		" + "0" + "\n".c_unescape())
	add_text("speed		" + "0" + "\n".c_unescape())
	add_text("damage	" + "0" + "\n".c_unescape())
