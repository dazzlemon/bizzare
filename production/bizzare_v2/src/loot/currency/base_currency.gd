class_name BaseCurrency
extends Consumable

var min_value = 50
var max_value = 100

func die(area):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	push_currency(rng.randi_range(min_value, max_value) * area.get_node("../Inventory").currency_multiplier, area)
	

func push_currency(value, area):
	area.get_node("../Inventory").currency_amount += value
