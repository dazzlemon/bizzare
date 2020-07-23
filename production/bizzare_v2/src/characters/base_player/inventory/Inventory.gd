#base inventory for all playable characters
class_name Inventory
extends Node

var array := []

#func _process(delta):
	#print(array.front())
func print_inventory():
	for i in range(array.size()):
		print(array[i])


