#base control(name is subject to change) class for all playable characters
class_name BasePlayerControl#mb rename
extends BaseControl

onready var spell_1 = get_node("../spell_1")
onready var spell_2 = get_node("../spell_2")

func _process(delta: float):
	input_loop()
	crosshair.global_position = get_global_mouse_position()
	._process(delta)

func input_loop():
	if Input.is_action_just_pressed("spell_1") && spell_1 != null:
		spell_1.try_use()
	if Input.is_action_just_pressed("spell_2") && spell_2 != null:
		spell_2.try_use()
	if Input.is_action_pressed("attack") && attack != null:
		attack.try_use()

func get_input_vector() -> Vector2:
	return Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")).normalized()
