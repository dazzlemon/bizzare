class_name BaseHands
extends Sprite

var rotation_limit = 24.4
#var start_angle = 0

onready var tween = get_node("../../Tween")
onready var min_deg = 180 + rotation_limit
onready var max_deg = 360 - rotation_limit

func _process(_delta):
	if not tween.is_active():
		var rot = fposmod(owner.get_angle_to(owner.crosshair.global_position), 2  * PI)
		_update_z(rad2deg(rot))
		set_rotation(rot)


func _update_z(rot_deg) -> void:
	z_index = 1 + int(fposmod(rot_deg, 360) < min_deg or fposmod(rot_deg, 360) > max_deg)
