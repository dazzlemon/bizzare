#
class_name Goblin
extends BaseNPCMelee

func _ready():
	ACCEL = 300
	MAX_SPEED = 50
	DECEL = 200


func _physics_process(delta):
	if velocity != Vector2.ZERO:
		animation_tree.get("parameters/playback").travel("orc_melee_run")
	else:
		animation_tree.get("parameters/playback").travel("orc_melee_idles")
	animation_tree["parameters/orc_melee_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	animation_tree["parameters/orc_melee_run/blend_position"] = (crosshair.global_position - global_position).normalized()
	._physics_process(delta)
