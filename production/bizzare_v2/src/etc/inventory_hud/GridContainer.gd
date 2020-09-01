extends GridContainer

var slot_scene =  preload("res://src/etc/inventory_hud/Slot1.tscn")
var slots_amount = 24
var slots := []
onready var coin_texture
onready var inventory =  get_node("../../../../Inventory")

var texture_dict = {
	coin_texture : preload("res://assets/textures/Coin.png")
}

func _ready():
	for i in range(slots_amount):
		var slot = slot_scene.instance()
		#slots[i] = slot
		print(str(i) + ":#") #DEBUG
		add_child(slot)


func _process(delta): 
	for i in range(slots_amount):
		slots[i] = null
	for i in range(inventory.size()):
		slots[i].texture = texture_dict[inventory[i]]
		slots[i].label = inventory[i].amount
