class_name Phase1Attack1Control
extends PhaseAttacks

var angle = 0 setget angle_set
var angle_step = 10

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_1_attack_1/phase_1_attack_1_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")

func _ready():
	_DURATION = 6.01
	_WAVE_INTERVAL = 0.75


func _start():
	var amount = 18
	for i in range(0, amount, 1): #maybe potencialniy amount + 1
		spawn_projectile(deg2rad(angle + 360 / amount * i))
	angle += angle_step


func spawn_projectile(angle):
	var projectile_instance = projectile.instance()
	get_root.owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_root.global_transform
	projectile_instance.direction = (Vector2(sin(angle), cos(angle)))
	projectile_instance.damage = stats.damage


func angle_set(angle_new):
	angle = angle_new
	while angle >= 360:
		angle -= 360


func _stop():
	get_parent.phase_attack_ended()
