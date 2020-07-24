extends RichTextLabel

onready var inventory_arr = get_node("../../Inventory").array

func _process(delta):
	set_text("Name Count Age")
	newline()
	for i in range(inventory_arr.size()):
		add_text(str(inventory_arr[i]))
		newline()
