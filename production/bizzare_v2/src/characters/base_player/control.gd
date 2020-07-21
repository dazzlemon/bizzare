extends "res://src/characters/control.gd"

onready var spell_1 = get_node("../spell_1")
onready var spell_2 = get_node("../spell_2")

func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()
	
func _process(delta):
	if Input.is_action_just_pressed("spell_1") && spell_1 != null:
		spell_1.try_use()
	if Input.is_action_just_pressed("spell_2") && spell_2 != null:
		spell_2.try_use()
	if Input.is_action_pressed("attack") && attack != null:
		attack.try_use()
