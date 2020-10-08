class_name BaseHands
extends Sprite

var rotation_limit = 29.22

onready var tween = get_node("../../Tween")

func _process(delta):
	if not tween.is_active():
		rotation = owner.get_angle_to(owner.crosshair.global_position) 
		z_index = 1 + int(fposmod(rotation_degrees, 360) < 180  + rotation_limit or fposmod(rotation_degrees, 360) > 360 - rotation_limit)
