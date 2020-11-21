class_name Collectable
extends Consumable

export var item_name = "item"
var count := 1

func push_item(item, area) -> void:
	var inventory = area.get_node("../Inventory").array
	if item[0] in inventory:
		inventory[item[0]] += 1
	else:
		inventory[item[0]] = 1
	
#	var is_found := false
#	for i in range(inventory.size()):
#		if inventory[i][0] == item[0]:#0 = item_name#if item is already in inventory than stack it
#			inventory[i][1] += 1 #1 = count
#			is_found = true
#			break
#	if not is_found:
#		inventory.push_front(item)##############GAVNO NADA REFACTOr


func die(area):
	push_item([item_name, count], area)
