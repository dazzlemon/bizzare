class_name DamageOrb
extends Collectable

func _on_Area2D_area_entered(area):
	area.get_node("../stats").damage = area.get_node("../stats").damage * 1.15
	._on_Area2D_area_entered(area)
