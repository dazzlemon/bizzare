extends RichTextLabel

onready var inventory_arr: Array = get_node("../../Inventory").array

func _process(_delta) -> void:
	set_text("Name Count Age\n".c_unescape())
	for i in range(inventory_arr.size()):
		add_text(str(inventory_arr[i]) + "\n".c_unescape())
