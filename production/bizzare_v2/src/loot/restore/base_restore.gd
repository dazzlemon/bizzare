class_name BaseRestore
extends Consumable

var restore_value = 50
var max_value_str = ["max_health"]
var value_str = ["health"]#these 2 must be same length!


func die(area):
	restore(area.get_node("../stats"))
	

func restore(stats):
	for i in range(max_value_str.size()):
		stats.set(value_str[i], restore_value + stats.get(value_str[i]))


func _on_area_entered(area):
	if _not_full(area.get_node("../stats")):
		._on_area_entered(area)


func _not_full(stats):
	for i in range(max_value_str.size()):
		if stats.get(value_str[i]) != stats.get(max_value_str[i]):
			return true
	return false
