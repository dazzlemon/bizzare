class_name HealthOrb
extends Collectable


func _on_Area2D_area_entered(area):
	area.get_node("../stats").max_health = area.get_node("../stats").max_health * 1.1
	area.get_node("../stats").health = area.get_node("../stats").health * 1.1
	._on_Area2D_area_entered(area)
