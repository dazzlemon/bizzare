class_name Harpy
extends BaseNPCRange


func _ready():
	MAX_SPEED = 50


func _physics_process(delta):
	animation_tree["parameters/harpy_idles/blend_position"] = (crosshair.global_position - global_position).normalized()
	._physics_process(delta)
