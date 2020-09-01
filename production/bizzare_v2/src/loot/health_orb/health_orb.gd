class_name HealthOrb
extends Collectable


func die(area):
	area.get_node("../stats").max_health = area.get_node("../stats").max_health * 1.1
	area.get_node("../stats").health = area.get_node("../stats").health * 1.1
	.die(area)
