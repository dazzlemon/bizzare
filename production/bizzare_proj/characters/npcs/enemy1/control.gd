extends Control

onready var playerDetectionZone = $PlayerDetectionZone
onready var wanderController = $WanderController
export var wander_target_range = 4
enum{
	IDLE,
	WANDER,
	CHASE,
}

var state = CHASE

func _ready():
	pick_random_state([IDLE, WANDER])

func get_input_vector():
	var input_vector = Vector2.ZERO#govnogovna#NEED_TO_FIX_ASAP#GO_VALORANT
	
	match state:
		IDLE:
			#var rng = RandomNumberGenerator.new()
			#rng.randomize()	
			#input_vector= (playerBody.global_position - global_position)
			#input_vector.x = rng.randf_range(-1.0, 1.0)
			#input_vector.y = (1 if rng.randi_range(0, 1) == 0 else -1) * (1 - input_vector.x * input_vector.x)
			#input_vector = Vector2.ZERO
			
			seek_player()
			
			if wanderController.get_time_left() == 0:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 1.5))
		WANDER:
			seek_player()
			if wanderController.get_time_left() == 0:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 1.5))
				
			var direction = get_node("../").global_position.direction_to(wanderController.target_position)
			input_vector = direction
			
			if get_node("../").global_position.distance_to(wanderController.target_position) <= wander_target_range :
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
			
		CHASE:
			
			var player = playerDetectionZone.player
			if player != null:
				var direction =get_node("../").global_position.direction_to(player.global_position)
				input_vector = direction
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

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
