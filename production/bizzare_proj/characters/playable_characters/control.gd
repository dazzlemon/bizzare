extends Control

var E_skill_allowed = true

func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return input_vector.normalized()

func attack_pressed():
	return Input.is_action_pressed("attack")

func Q_spell_pressed():
	return Input.is_action_pressed("Q_spell")

func _process(delta):
	if Input.is_action_pressed("E_spell") and E_skill_allowed == true:
		get_node("../").DMG_BLOCK = 0.3
		get_node("E_skill_duration").start()
		E_skill_allowed = false
		get_node("E_skill_cd").start()
		
		
func _on_E_skill_duration_timeout():
	get_node("../").DMG_BLOCK = 0

func _on_E_skill_cd_timeout():
	E_skill_allowed = true 
