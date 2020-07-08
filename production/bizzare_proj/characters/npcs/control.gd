extends Control

func get_input_vector():
	var rng = RandomNumberGenerator.new()
	rng.randomize()	
	
	var input_vector = Vector2.ZERO
	input_vector.x = rng.randf_range(-1.0, 1.0)
	input_vector.y = (1 if rng.randi_range(0, 1) == 0 else -1) * (1 - input_vector.x * input_vector.x)
	return input_vector.normalized()

func attack_pressed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(0, 1) == 0
