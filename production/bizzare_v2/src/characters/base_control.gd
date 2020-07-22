#basic interface class between player/AI and character
class_name BaseControl#mb rename
extends Control

onready var crosshair = get_node("../crosshair")
onready var attack = get_node("../attack")

func _process(_delta) -> void:
	crosshair.set_g_pos(get_global_mouse_position())#prolly has to be in the player's inherited control
	if(attack != null):
		var body_cross_dir = attack.get_angle_to(crosshair.global_position)
		attack.rotation += body_cross_dir
