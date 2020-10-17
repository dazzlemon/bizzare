class_name HarpyBoss
extends BaseNPCRange

func _ready():
	MAX_SPEED = 75


func _physics_process(delta):
	if velocity != Vector2.ZERO:
		crosshair.global_position = global_position + velocity.normalized() #velocity.normalized() 
	animation_tree["parameters/harpy_boss_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	._physics_process(delta)
