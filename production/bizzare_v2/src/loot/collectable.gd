class_name Collectable
extends Area2D

export var item_name = "item"
var count := 1
var age := 1
onready var icon = get_node("Sprite")

func push_item(item, area) -> void:
	var inventory = area.get_node("../Inventory").array
	var condition := false
	for i in range(inventory.size()):
		if inventory[i][0] == item[0]:#0 = item_name#if item is already in inventory than stack it
			inventory[i][1] += 1 #1 = count
			condition = true
		if condition == true:
			break
	if condition == false:
		inventory.push_front(item)
	#for i in inventory:
	#	if i.name == item.name:
	#		i.count++
	#		break;
	#else:
	#	inventory.push_front(item)


func _on_Area2D_area_entered(area):
	push_item([item_name, count, icon.texture], area)
	queue_free()
