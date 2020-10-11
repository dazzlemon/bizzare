class_name BaseHands
extends Sprite

var rotation_limit = 29.22
#var start_angle = 0

onready var tween = get_node("../../Tween")
onready var min_deg = 180 + rotation_limit
onready var max_deg = 360 - rotation_limit

func _process(_delta):
	if not tween.is_active():
		z_index = _update_z()


func _update_z() -> int:
	rotation = owner.get_angle_to(owner.crosshair.global_position)
	return 1 + int(fposmod(rotation_degrees, 360) < min_deg or fposmod(rotation_degrees, 360) > max_deg)
