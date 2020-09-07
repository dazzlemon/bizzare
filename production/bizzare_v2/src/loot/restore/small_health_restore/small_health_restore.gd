class_name SmallHPRestore
extends BaseRestore

func _ready():
	restore_value = 10

func _on_area_entered(area):
	if area.get_node("../stats").health != area.get_node("../stats").max_health:
		._on_area_entered(area) 

func restore_hp(stats):
	stats.health += restore_value
	if stats.health > stats.max_health:
		.restore_hp(stats)
	
