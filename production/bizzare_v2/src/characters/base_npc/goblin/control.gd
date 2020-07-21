extends "res://src/characters/base_npc/control.gd"

onready var playerDetectionZone = $player_detection_zone
onready var wanderController = $wander_controller
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
	var input_vector = Vector2.ZERO
	var this_enemy = get_node("../")
	match state:
		IDLE:
			idle()
		WANDER:
			#wander(this_enemy, input_vector)
			seek_player()
			if wanderController.get_time_left() == 0:
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 1.5))
				
			var direction = this_enemy.global_position.direction_to(wanderController.position_target)
			input_vector = direction
			
			if this_enemy.global_position.distance_to(wanderController.position_target) <= wander_target_range :
				state = pick_random_state([IDLE, WANDER])
				wanderController.start_wander_timer(rand_range(1, 3))
		CHASE:
			#chase(this_enemy, input_vector)
			var player = playerDetectionZone.player
			if player != null:
				var direction = this_enemy.global_position.direction_to(player.global_position)
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
	
func idle():
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
		
func wander(this_enemy, input_vector):
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
				
	var direction = this_enemy.global_position.direction_to(wanderController.target_position)
	input_vector = direction
			
	if this_enemy.global_position.distance_to(wanderController.target_position) <= wander_target_range :
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 3))
		
func chase(this_enemy, input_vector):
	var player = playerDetectionZone.player
	if player != null:
		var direction = this_enemy.global_position.direction_to(player.global_position)
		input_vector = direction
	else:
		state = IDLE
	#sprite.flip_h = velocity.x<0 (rotate spite in player direction)
