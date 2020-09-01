class_name DamageOrb
extends Collectable

func die(area):
	area.get_node("../stats").damage = area.get_node("../stats").damage * 1.15
	.die(area)
