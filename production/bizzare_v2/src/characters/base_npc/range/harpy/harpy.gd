class_name Harpy
extends BaseNPCRange


func _ready():
	MAX_SPEED = 50


func _physics_process(delta):
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree["parameters/harpy_idles/blend_position"] = control.get_input_vector()
	._physics_process(delta)


