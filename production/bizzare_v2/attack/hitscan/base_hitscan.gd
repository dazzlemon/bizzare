extends Position2D

var ATTACK_DURATION_SEC = 0.25
var ATTACK_INTERVAL = 0.15

var attack_active
var attack_active_timeleft_sec
var attack_wait_for_next_sec

func _ready():
	attack_active = false
	attack_wait_for_next_sec = 0

func update_state():
	get_node("hitbox/CollisionShape2D").disabled = not attack_active

func _physics_process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if attack_active:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			attack_active = false
			update_state()
		
func try_use():
	if able_to_use():
		attack_active = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	update_state()
	
func able_to_use():
	return attack_wait_for_next_sec <= 0
