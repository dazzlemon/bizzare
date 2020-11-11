class_name Phase3Attack2Control
extends PhaseAttacks


var angle = 0 setget angle_set
var angle_step = 40

onready var projectile = preload("res://src/characters/base_npc/harpy_boss/phase_attacks/phase_3_attack_2/phase_3_attack_2_tornado_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")
onready var ray_hitscan = $ray_hitscan

func _ready() -> void:
	_DURATION = 8
	_WAVE_INTERVAL = 2


func _start() -> void:
	var amount = 3
	for i in range(0, amount, 1): #maybe potencialniy amount + 1
		spawn_projectile(deg2rad(angle + 360 / amount * i))
	angle += angle_step
	ray_hitscan.try_use()


func spawn_projectile(angle: float) -> void:
	var projectile_instance = projectile.instance()
	get_node("../../../").call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_root.global_transform
	projectile_instance.position = get_root.global_position + Vector2(0, 150).rotated(angle)
	projectile_instance.direction = (Vector2(sin(angle), cos(angle)))
	projectile_instance.damage = stats.damage
	ray_hitscan.visible = true

func angle_set(angle_new: float) -> void:
	angle = angle_new
	while angle >= 360:
		angle -= 360


func _stop() -> void:
	get_parent.phase_attack_ended()
	ray_hitscan.visible = false
