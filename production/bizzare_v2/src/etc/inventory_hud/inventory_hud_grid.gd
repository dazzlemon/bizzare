extends GridContainer

var slot_scene = preload("res://src/etc/inventory_hud/slot.tscn")
var max_slots = 20
var slots := []
onready var inventory = get_node("../../../../../Inventory")#PYAT' RAZ KARL!!!!!!!

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
	var i := 0
	#print(inventory)
	for item in inventory.array:
		slots[i].contents = [item, inventory.array[item]]
		slots[i].empty = false
		i += 1

func _draw_slots():
	for slot in slots:
		if not slot.empty:
			slot.get_node("textrect").texture = _get_texture(slot.contents[0])
			slot.get_node("label").text = str(slot.contents[1])#amount
		else:
			slot.empty = slot.empty#tmp, need to set counter to "", and empty structure


func _get_texture(name):#ETO KOSTIL'!!!
	return load("res://assets/textures/items/" + name + ".png")
	
