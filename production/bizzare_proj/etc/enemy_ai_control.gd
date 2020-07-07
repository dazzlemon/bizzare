extends Control

func get_input_vector():
	var input_vector = Vector2.ZERO
	input_vector.x = 0
	input_vector.y = 0
	return input_vector.normalized()

func attack_pressed():
	return false
