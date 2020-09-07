class_name SmallArmorRestore
extends BaseRestore

func _ready():
	restore_value = 10

func _on_area_entered(area):
	if area.get_node("../stats").armor != area.get_node("../stats").max_armor:
		._on_area_entered(area) 

func restore_hp(stats):
	stats.armor += restore_value
	if stats.armor > stats.max_armor:
		stats.armor = stats.max_armor
