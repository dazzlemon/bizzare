class_name RayHitscan
extends RayCast2D

var ATTACK_DURATION_SEC := 0.25# has to be const actually but aswell has to be changeable in inherited classes
var ATTACK_INTERVAL := 0.5# same applies here

var attack_active_timeleft_sec = 0# static type is probably float, but im not sure
var attack_wait_for_next_sec = 0# same here

func _process(delta) -> void:
	# updates timers and state if needed
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if enabled:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			enabled = false
	#mb refactor
	cast_to = get_node("../crosshair").global_position - get_node("../").global_position
	if enabled and get_node("../../control/player_detection_zone").can_see_player():
		var player = get_node("../../control/player_detection_zone").player
		if player is BaseChar:
			player.take_damage(5*delta)

func try_use() -> void:
	if is_able_to_use():
		enabled = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	
	
func is_able_to_use() -> bool:
	return attack_wait_for_next_sec <= 0
