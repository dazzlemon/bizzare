class_name Phase1Attack2Control
extends Control

var angle = 0 setget angle_set
var angle_step = 20

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/phase_attacks/phase_1_attack_2/phase_1_attack_2_projectile.tscn")
onready var stats = get_node("../../stats")
onready var get_root = get_node("../../")
onready var get_parent = get_node("../")


func projectile_spiral(angle):
	spawn_projectile(angle)
	#spawn_projectile(180 + angle)#injan
	spawn_projectile(-angle)#tentacli
	self.angle += angle_step


func spawn_projectile(angle):
	var projectile_instance = projectile.instance()
	get_root.owner.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = get_root.global_transform
	projectile_instance.direction = (Vector2(sin(deg2rad(angle)), cos(deg2rad(angle))))
	projectile_instance.damage = stats.dmg


func angle_set(angle_new):
	angle = angle_new
	while angle >= 360:
		angle -= 360


func start():
	get_node("wave_interval").start()
	get_node("duration").start()


func _on_wave_interval_timeout():
	projectile_spiral(angle)


func _on_duration_timeout():
	get_parent.phase_attack_ended()
	get_node("wave_interval").stop()