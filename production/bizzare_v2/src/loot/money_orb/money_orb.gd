class_name MoneyOrb
extends Collectable

func die(area):
	area.get_node("../Inventory").currency_multiplier += 0.5
	.die(area)

