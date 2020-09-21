class_name FullRestore
extends BaseRestore

func _on_area_entered(area):
	if area.get_node("../stats").health != area.get_node("../stats").max_health or area.get_node("../stats").armor != area.get_node("../stats").max_armor :
		._on_area_entered(area) 

func restore_hp(stats):
	stats.health = stats.max_health
	stats.armor = stats.max_armor
