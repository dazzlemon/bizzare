class_name BaseCurrency
extends Collectable

var min_value = 50
var max_value = 100

func _on_Area2D_area_entered(area):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	push_currency(rng.randi_range(min_value, max_value), area)
	queue_free()


func push_currency(value, area):
	area.get_node("../Inventory").currency_amount += value
