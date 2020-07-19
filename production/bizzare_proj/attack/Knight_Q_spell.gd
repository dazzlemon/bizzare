extends Position2D

var ATTACK_DURATION_SEC = 0.25
var ATTACK_INTERVAL = 5

var attack_active
var attack_active_timeleft_sec
var attack_wait_for_next_sec

func _ready():
	attack_active = false
	attack_wait_for_next_sec = 0

func try_attack():
	get_node("swordhitbox/CollisionShape2D").disabled = not attack_active

func _process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if get_node("../control").Q_spell_pressed() and attack_wait_for_next_sec <= 0:
		attack_active = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	elif attack_active:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			attack_active = false
		try_attack()

