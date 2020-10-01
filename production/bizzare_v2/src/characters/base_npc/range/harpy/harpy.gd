class_name Harpy
extends BaseNPCRange


func _ready():
	MAX_SPEED = 50


func _physics_process(delta):
	if control.state == control.States.WANDER or velocity != Vector2.ZERO:
		crosshair.global_position = global_position + velocity.normalized() #velocity.normalized() 
	animation_tree["parameters/harpy_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	._physics_process(delta)
