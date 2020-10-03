#
class_name Goblin
extends BaseNPCMelee

func _ready():
	ACCEL = 300
	MAX_SPEED = 50
	DECEL = 200


func _physics_process(delta):
	animation_tree["parameters/orc_melee_idles/blend_position"] = control.get_input_vector()
	animation_tree["parameters/orc_melee_run/blend_position"] = control.get_input_vector()#(crosshair.global_position - global_position).normalized()
	if control.get_input_vector() != Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("orc_melee_run")
	else:
		animation_tree.get("parameters/playback").travel("orc_melee_idles")
	._physics_process(delta)
