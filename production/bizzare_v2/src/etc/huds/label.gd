extends Label
onready var inventory = get_node("../../../Inventory")


func _process(delta):
	set_text(str(inventory.currency_amount))
