class_name BaseHands
extends Sprite


var rotation_limit = 29.22
var start_angle = 0

onready var tween = get_node("../../Tween")
onready var control = get_node("../../control")


func _process(delta):
	if not tween.is_active():
		rotation += get_angle_to(get_owner().crosshair.global_position) + start_angle
		z_index = 1 + int(fposmod(rotation_degrees, 360) < 180  + rotation_limit or fposmod(rotation_degrees, 360) > 360 - rotation_limit)
