extends Control

var projectile = preload("res://attack/projectile/Projectile.tscn")

const ATTACK_INTERVAL = 0.15

var attack_active
var attack_wait_for_next_sec

func _ready():
	attack_active = false
	attack_wait_for_next_sec = 0

func try_attack():
	var projectile_instance = projectile.instance()
	get_node("../").owner.add_child(projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.rotation += get_node("../").get_angle_to(get_global_mouse_position())
	projectile_instance.direction = (get_global_mouse_position() - get_node("../").global_position).normalized()#use local crosshair's position instead of mice's one

func _process(delta):
	if attack_wait_for_next_sec > 0:
		attack_wait_for_next_sec -= delta
	if get_node("../control").attack_pressed() and attack_wait_for_next_sec <= 0:
		attack_active = true
		attack_wait_for_next_sec = ATTACK_INTERVAL
	elif attack_active:
		attack_active = false
		try_attack()
