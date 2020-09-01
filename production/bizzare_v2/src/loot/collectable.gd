class_name Collectable
extends Consumable

export var item_name = "item"
var count := 1

func push_item(item, area) -> void:
	var inventory = area.get_node("../Inventory").array
	var found := false
	for i in range(inventory.size()):
		if inventory[i][0] == item[0]:#0 = item_name#if item is already in inventory than stack it
			inventory[i][1] += 1 #1 = count
			found = true
			break
	if not found:
		inventory.push_front(item)


func die(area):
	push_item([item_name, count, get_node("area/sprite").texture], area)
