class_name ApprenticeControl
extends BaseNPCRangeControl

func _ready():
	state = States.ATTACK

func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO

func attack() -> Vector2:
	var player = get_node("../../control/player_detection_zone").player
	if player != null and get_node("../../control/player_detection_zone").can_see_player():
		get_node("../crosshair").global_position = player.global_position
		get_node("../attack").try_use()
	return Vector2.ZERO
