class_name Shadow
extends BaseNPCMelee

func _ready():
	ACCEL = 300
	MAX_SPEED = 50
	DECEL = 200


func _physics_process(delta):
	if control.state == control.States.WANDER or velocity != Vector2.ZERO:
		crosshair.global_position = global_position + velocity.normalized() #velocity.normalized() 
	animation_tree["parameters/shadow_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	._physics_process(delta)
