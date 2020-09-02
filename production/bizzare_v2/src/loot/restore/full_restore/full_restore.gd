class_name FullRestore
extends BaseRestore


func restore_hp(stats):
	stats.health = stats.max_health
	stats.armor = stats.max_armor
