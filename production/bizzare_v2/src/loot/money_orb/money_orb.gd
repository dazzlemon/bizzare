class_name MoneyOrb
extends Collectable

func _on_Area2D_area_entered(area):
	area.get_node("../Inventory").currency_multiplier += 0.5 
	._on_Area2D_area_entered(area)

