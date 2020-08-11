#
class_name BaseNPCControl
extends BaseControl

export var wander_target_range = 4

onready var this_enemy = get_node("../")
onready var playerDetectionZone = $player_detection_zone
onready var wanderController = $wander_controller
onready var attackRange = $attack_range

enum States {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	STOP,
	DASH,
}

const state_funcs = {
	States.IDLE : "idle",
	States.WANDER : "wander",
	States.CHASE : "chase",
	States.ATTACK : "attack",
	States.STOP : "stop",
	States.DASH : "dash",}

var state = States.CHASE

func _ready():
	randomize()
	pick_random_state([States.IDLE, States.WANDER])


func get_input_vector() -> Vector2:
	return call(state_funcs[state])#.normalized()


func attack_pressed():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	return rng.randi_range(0, 1) == 0


func seek_player():
	if playerDetectionZone.can_see_player():
		state = States.CHASE


func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()


func idle() -> Vector2:
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([States.IDLE, States.WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
	return Vector2.ZERO


func wander() -> Vector2:
	seek_player()
	if wanderController.get_time_left() == 0:
		state = pick_random_state([States.IDLE, States.WANDER])
		wanderController.start_wander_timer(rand_range(1, 1.5))
	var direction = this_enemy.global_position.direction_to(wanderController.position_target)
	if this_enemy.global_position.distance_to(wanderController.position_target) <= wander_target_range :
		state = pick_random_state([States.IDLE, States.WANDER])
		wanderController.start_wander_timer(rand_range(1, 3))
	return direction


func chase() -> Vector2:
	var player = playerDetectionZone.player
	var direction := Vector2.ZERO
	if player != null and playerDetectionZone.can_see_player():
		direction = this_enemy.global_position.direction_to(player.global_position)
	else:
		state = States.IDLE
#	sprite.flip_h = velocity.x < 0 #(rotate spite in player direction)
	return direction

func attack() -> Vector2:
	var player = playerDetectionZone.player
	if player != null and playerDetectionZone.can_see_player():
		get_node("../crosshair").global_position = player.global_position
	get_node("../attack").try_use()
	return Vector2.ZERO


func stop() -> Vector2:
	return Vector2.ZERO


func dash() -> Vector2:
	return Vector2.ZERO
