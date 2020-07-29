#
class_name GoblinControl
extends BaseNPCMeleeControl

export var wander_target_range = 4

onready var this_enemy = get_node("../")
onready var playerDetectionZone = $player_detection_zone
onready var wanderController = $wander_controller

enum{
	IDLE,
	WANDER,
	CHASE,

}

var state = CHASE

func _ready():
	pick_random_state([IDLE, WANDER])


func get_input_vector():
	var input_vector: Vector2 
	match state:
		IDLE:
			input_vector = idle()
		WANDER:
			input_vector = wander()
		CHASE:
			input_vector = chase()
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


func idle() -> Vector2:
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
	return Vector2.ZERO


func wander() -> Vector2:
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
	var direction = this_enemy.global_position.direction_to(wanderController.position_target)
	if this_enemy.global_position.distance_to(wanderController.position_target) <= wander_target_range :
		state = pick_random_state([IDLE, WANDER])
		wanderController.start_wander_timer(rand_range(1, 3))
	return direction


func chase() -> Vector2:
	var player = playerDetectionZone.player
	var direction := Vector2.ZERO
	if player != null and playerDetectionZone.can_see_player():
		direction = this_enemy.global_position.direction_to(player.global_position)
	else:
		state = IDLE
#	sprite.flip_h = velocity.x < 0 #(rotate spite in player direction)
	return direction
