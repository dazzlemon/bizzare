#WIP
class_name KnightAOE
extends BaseHitscan

func _ready():
	ATTACK_DURATION_SEC = 0.15
	ATTACK_INTERVAL = 5
	get_node("duration").wait_time = ATTACK_DURATION_SEC
	get_node("cd").wait_time = ATTACK_INTERVAL

func try_use() -> void:
	if is_able_to_use():
		get_node("duration").start()
		get_node("cd").start()
		attack_active = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	update_state()
