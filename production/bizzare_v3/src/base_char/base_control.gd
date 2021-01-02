class_name BaseControl#mb rename
extends Control

onready var crosshair = get_node("../crosshair")

func get_input_vector() -> Vector2:
	return Vector2.ZERO
