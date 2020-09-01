class_name ArmorOrb
extends Collectable


func die(area):
	area.get_node("../stats").max_armor = area.get_node("../stats").max_armor * 1.1
	area.get_node("../stats").armor = area.get_node("../stats").armor * 1.1
	.die(area)
