class_name SmallArmorRestore
extends BaseRestore

func _ready():
	restore_value = 10

func restore_hp(stats):
	stats.armor += restore_value
	if stats.armor > stats.max_armor:
		stats.armor = stats.max_armor
