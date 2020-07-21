# basic hitscan attack
#
# mb refactor to use timer(s)
class_name baseHitscan
extends Position2D

var ATTACK_DURATION_SEC := 0.25# has to be const actually but aswell has to be changeable in inherited classes
var ATTACK_INTERVAL := 0.15# same applies here

var attack_active := false
var attack_active_timeleft_sec = 0# static type is probably float, but im not sure
var attack_wait_for_next_sec = 0# same here

func _process(delta) -> void:
	# updates timers and state if needed
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if attack_active:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			attack_active = false
			update_state()# mb make out of if and remove from try_use()?


func update_state() -> void:
	get_node("hitbox/CollisionShape2D").disabled = not attack_active


func try_use() -> void:
	if is_able_to_use():
		attack_active = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	update_state()
	
	
func is_able_to_use() -> bool:
	return attack_wait_for_next_sec <= 0
