#
class_name BaseNPCControl
extends BaseControl


var state = States.IDLE setget state_set
export var wander_target_range = 4

onready var player_detection_zone = $player_detection_zone
onready var wander_controller = $wander_controller
onready var attack_range = $attack_range
onready var raycast = $player_detection_zone/LookAt
onready var animation_player = get_node("../AttackPlayer")

enum States {
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	STOP,
	DASH,
}


func state_set(state_):
	if state != States.DASH:
		if (state_ == States.ATTACK or state_ == States.CHASE) and player_detection_zone.can_see_player():
			if state_ == States.CHASE and attack_range != null and attack_range.player != null:
				return
			player_detection_zone.look_at.cast_to = player_detection_zone.player.global_position - owner.global_position
		state = state_
	if state != States.ATTACK:
		animation_player.stop()

func _ready() -> void:
	randomize()
	Utility.pick_random([States.IDLE, States.WANDER])


func get_input_vector() -> Vector2:
	return call(var2str(States.keys()[state]).to_lower().replace("\"", ""))


func seek_player() -> void:
	if player_detection_zone.can_see_player():
		state = States.CHASE


func idle() -> Vector2:
	seek_player()
	wander_controller() 
	return Vector2.ZERO


func wander() -> Vector2:
	idle()
	var direction = owner.global_position.direction_to(wander_controller.position_target)
	raycast.cast_to = direction * 20
	if owner.global_position.distance_to(wander_controller.position_target) <= wander_target_range:
		state = Utility.pick_random([States.IDLE, States.WANDER])
		wander_controller.start_wander_timer(rand_range(1, 3))
	return direction


func chase() -> Vector2:
	var direction := Vector2.ZERO
	if player_detection_zone.can_see_player():
		var player_pos = player_detection_zone.player.global_position
		var owner_pos = owner.global_position
		if attack_range != null:#range
			if attack_range.player == null:
				direction = owner_pos.direction_to(player_pos)
			else:
				state = States.ATTACK
		else:#melee
			if owner_pos.distance_to(player_pos) > 25:
				direction = owner_pos.direction_to(player_pos)
			else:
				state = States.ATTACK
	else:
		state = Utility.pick_random([States.IDLE, States.WANDER])
	return direction


func attack() -> Vector2:
	if player_detection_zone.can_see_player():
		if _can_attack():
			get_node("../crosshair").global_position = player_detection_zone.player.global_position
			get_node("../attack").try_use()
		else:
			state = States.CHASE
	else:
		state = Utility.pick_random([States.IDLE, States.WANDER])
	return Vector2.ZERO


func _can_attack() -> bool:
	if attack_range == null:#melee
		return owner.global_position.distance_to(player_detection_zone.player.global_position) < 25
	else:#range
		return attack_range.player != null

func stop() -> Vector2:
	return Vector2.ZERO


func dash() -> Vector2:
	return Vector2.ZERO


func wander_controller() -> void:
	if wander_controller.get_time_left() == 0:
		state = Utility.pick_random([States.IDLE, States.WANDER])
		wander_controller.start_wander_timer(rand_range(1, 1.5))
