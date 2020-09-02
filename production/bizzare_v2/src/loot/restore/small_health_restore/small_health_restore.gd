class_name SmallHPRestore
extends BaseRestore

func _ready():
	restore_value = 10

func restore_hp(stats):
	stats.health += restore_value
	if stats.health > stats.max_health:
		.restore_hp(stats)
	
