#WIP
#
#
#
#
#
#
#
#SEEMS LIKE 04ko need refactor (imho)		SEEMS LIKE 04ko need refactor (imho)		SEEMS LIKE 04ko need refactor (imho)
class_name Collectable
extends Area2D
export var item_name = "item"
var count := 1
var age := 0

func push_item(item, area):#idk what static types are these
	var inventory = area.get_node("../Inventory").array
	var condition := false
	for i in range(inventory.size()):
		if inventory[i][0] == item[0]:#0 = item_name
			inventory[i][1] += 1 #1 = count
			condition = true
		if condition == true:
			break
	if condition == false:
		inventory.push_front(item)
		item[2] = inventory.size()#2 = age


func _on_Area2D_area_entered(area):
	push_item([item_name, count, age], area)
	queue_free()
