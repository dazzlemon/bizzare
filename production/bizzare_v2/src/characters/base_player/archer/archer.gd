#
class_name Archer
extends BasePlayer


func _ready():
	MAX_SPEED = 175


func _physics_process(delta):
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree["parameters/archer_idles/blend_position"] = control.get_input_vector()
		animation_tree["parameters/archer_run/blend_position"] = control.get_input_vector()
		animation_tree.get("parameters/playback").travel("archer_run")
	else:
		animation_tree.get("parameters/playback").travel("archer_idles")
	._physics_process(delta)
