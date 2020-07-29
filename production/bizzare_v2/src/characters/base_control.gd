#basic interface class between player/AI and character
class_name BaseControl#mb rename
extends Control

onready var crosshair = get_node("../crosshair")
onready var attack = get_node("../attack")

func _process(_delta) -> void:
	if attack != null && attack is BaseHitscan:
		var body_cross_dir = attack.get_angle_to(crosshair.global_position)
		attack.rotation += body_cross_dir


func get_input_vector():
	return Vector2.ZERO
