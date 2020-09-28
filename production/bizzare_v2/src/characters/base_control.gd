#basic interface class between player/AI and character
class_name BaseControl#mb rename
extends Control

onready var crosshair = get_node("../crosshair")
onready var attack = get_node("../attack")
onready var shift_dodge = get_node("../shift_dodge")

func _process(_delta) -> void:
	if attack != null && attack is BaseHitscan:
		attack.rotation += attack.get_angle_to(crosshair.global_position)


func get_input_vector() -> Vector2:
	return Vector2.ZERO
