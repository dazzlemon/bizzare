class_name RayHitscanProcess
extends RayCast2D

var crosshair
var player_detection_zone
var length_def = 200

onready var double_up = get_node("../../")
onready var sprite = $Sprite

func _process(delta: float) -> void:
	_try_damage(delta)
	_update_texture()


func _update_texture():
	sprite.rotation = cast_to.angle()
	if is_colliding():
		sprite.region_rect.end.x = (get_collider().global_position - global_position).length()
	else:
		sprite.region_rect.end.x = length_def

func _try_damage(delta: float) -> void:
	var collider = get_collider()
	if is_colliding() and collider is BaseHurtbox:
		collider.get_parent().take_damage(5 * delta)
