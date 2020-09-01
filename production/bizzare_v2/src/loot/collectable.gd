class_name Collectable
extends Area2D

export var item_name = "item"
var count := 1
var age := 1
onready var icon = get_node("Sprite")

func push_item_to_hud(item,area): # mb ->void
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
		item[2] = inventory.size()


func _on_Area2D_area_entered(area):
	push_item_to_hud([item_name, count, icon.texture], area)
	queue_free()



#func push_item(item, area):#idk what static types are these
#	push_item_to_hud(item,area)
#	var inventory = area.get_node("../Inventory").array
#	var condition := false
#	for i in range(inventory.size()):
#		if inventory[i][0] == item[0]:#0 = item_name
#			inventory[i][1] += 1 #1 = count
#			condition = true
#		if condition == true:
#			break
#	if condition == false:
#		inventory.push_front(item)
#		item[2] = inventory.size()#2 = age
