class_name Harpy
extends BaseNPCRange

onready var animation_tree = $AnimationTree
#var KekW 


func _physics_process(delta):
	#print(control.get_input_vector())
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree["parameters/harpy_idles/blend_position"] = control.get_input_vector()
	._physics_process(delta)


