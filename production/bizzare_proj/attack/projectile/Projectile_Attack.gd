extends Control

var projectile = preload("res://attack/projectile/Projectile.tscn")

const ATTACK_DURATION_SEC = 0.25
const ATTACK_INTERVAL = 0.15

var attack_active
var attack_active_timeleft_sec
var attack_wait_for_next_sec

func _ready():
	attack_active = false
	attack_wait_for_next_sec = 0

func try_attack():
	var projectile_instance = projectile.instance()
	get_node("../").owner.add_child(projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.rotation += get_node("../").get_angle_to(get_global_mouse_position())

func _process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if get_node("../control").attack_pressed() and attack_wait_for_next_sec <= 0:
		attack_active = true
		attack_active_timeleft_sec = ATTACK_DURATION_SEC
		attack_wait_for_next_sec = ATTACK_INTERVAL + ATTACK_DURATION_SEC
	elif attack_active:
		if attack_active_timeleft_sec > 0:
			attack_active_timeleft_sec -= delta
		if attack_active_timeleft_sec <= 0:
			attack_active = false
		try_attack()
