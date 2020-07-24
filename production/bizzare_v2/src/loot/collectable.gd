#WIP
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


#func add_to_hud(item) -> void:
	#get_node("../Camera2D/Test_Inventory").add_text(str(item))

func _on_Area2D_area_entered(area):
	push_item([item_name, count, age], area)
	#add_to_hud([item_name, count, age])
	queue_free()
