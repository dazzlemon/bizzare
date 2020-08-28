class_name RayHitscanProcess
extends RayCast2D

onready var double_up = get_node("../../")
onready var crosshair = double_up.owner.crosshair
onready var player_detection_zone = double_up.get_parent().player_detection_zone

func _process(delta: float) -> void:
	_try_damage(delta)


func _try_damage(delta: float) -> void:
	var collider = get_collider()
	if is_colliding() and collider is BaseHurtbox:
		collider.get_parent().take_damage(5 * delta)
