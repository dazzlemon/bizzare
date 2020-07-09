extends Control

onready var playerDetectionZone = $PlayerDetectionZone

enum{
	IDLE,
	#WANDER,
	CHASE
}

var state = CHASE

func get_input_vector():
	
	var input_vector = Vector2.ZERO
	match state:
		IDLE:#govnogovna#NEED_TO_FIX_ASAP#GO_VALORANT
			#var rng = RandomNumberGenerator.new()
			#rng.randomize()	
			input_vector=Vector2.ZERO
			#input_vector= (playerBody.global_position - global_position)
			#input_vector.x = rng.randf_range(-1.0, 1.0)
			#input_vector.y = (1 if rng.randi_range(0, 1) == 0 else -1) * (1 - input_vector.x * input_vector.x)
			seek_player()
		#WANDER:5
			#pass
		CHASE:
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - get_node("../").global_position).normalized()
				input_vector = Vector2(direction * get_node("../").MAX_SPEED, get_node("../").ACCEL)
			else:
				state = IDLE
			#sprite.flip_h = velocity.x<0 (rotate spite in player direction)
	return input_vector.normalized()

func attack_pressed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(0, 1) == 0

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE


