class_name BaseHands
extends Sprite

var rotation_limit = 24.4


onready var tween = get_node("../../Tween")
onready var min_deg = 180 + rotation_limit
onready var max_deg = 360 - rotation_limit

func _process(_delta):
	if not tween.is_active():
		var rot = owner.get_angle_to(owner.crosshair.global_position)
		_update_z(fposmod(rad2deg(rot), 360))
		set_rotation(rot)


func _update_z(rot_deg) -> void:
	z_index = -1 + int(rot_deg < min_deg or rot_deg > max_deg)
