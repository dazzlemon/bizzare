# basic crosshair class
#
# represents where character is aiming to
class_name Crosshair
extends Position2D

func _ready() -> void:
	global_position = Vector2.ZERO
