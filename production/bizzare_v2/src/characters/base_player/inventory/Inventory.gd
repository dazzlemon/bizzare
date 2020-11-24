#base inventory for all playable characters
class_name Inventory
extends Node

var array := {}
var currency_amount: int 
var currency_multiplier := 1.0


func _process(delta):
	print (currency_multiplier)
