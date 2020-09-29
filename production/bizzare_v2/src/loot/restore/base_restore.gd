class_name BaseRestore
extends Consumable

var restore_value = 50
var max_value_str = "max_health" #DEFAULT VALUE
var value_str = "health"


func die(area):
	restore(area.get_node("../stats"))


func restore(stats):
	stats.set(value_str, stats.get(max_value_str))
