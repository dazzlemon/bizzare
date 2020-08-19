extends RichTextLabel

onready var inventory_arr = get_node("../../Inventory").array

func _process(_delta):
	set_text("Name Count Age\n".c_unescape())
	for i in range(inventory_arr.size()):
		add_text(str(inventory_arr[i]) + "\n".c_unescape())
