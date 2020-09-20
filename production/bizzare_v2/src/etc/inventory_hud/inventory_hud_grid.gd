extends GridContainer

var slot_scene = preload("res://src/etc/inventory_hud/slot.tscn")
var max_slots = 20
var slots := []
onready var coin_texture
onready var inventory = get_node("../../../../../Inventory").array

var texture_dict = {
	coin_texture : preload("res://assets/textures/Coin.png")
}

func _ready():
	for i in range(max_slots):
		var slot = slot_scene.instance()
		add_child(slot)
		slots.push_back(slot)


func _process(delta): 
	for i in range(slots.size()):
		slots[i].empty = true
	_update_slots()
	_draw_slots()


func _update_slots():
	for i in range(inventory.size()):
		slots[i].contents = inventory[i]
		slots[i].empty = false


func _draw_slots():
	for slot in slots:
		if not slot.empty:
			slot.get_node("textrect").texture = slot.contents[2]#texture
			slot.get_node("label").text = str(slot.contents[1])#amount
		else:
			slot.empty = slot.empty#tmp, need to set counter to "", and empty structure
