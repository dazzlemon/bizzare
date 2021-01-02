class_name BasePlayerControl#mb rename
extends BaseControl


func _process(delta: float):
	crosshair.global_position = get_global_mouse_position()
	#._process(delta)


func get_input_vector() -> Vector2:
	var dir := Vector2.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir.normalized()
