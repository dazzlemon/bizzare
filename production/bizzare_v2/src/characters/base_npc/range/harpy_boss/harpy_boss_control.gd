class_name HarpyBossControl
extends BaseNPCRangeControl

onready var projectile = preload("res://src/characters/base_npc/range/harpy_boss/attack/harpy_boss_projectile.tscn")
onready var stats = get_node("../stats")
onready var get_root = get_node("../")

var phase = 0
var count = 0
var ready = true
var current_phase_attack = null

enum AttackPhases{
	CIRCLE,
	SPIRAL,
}


func _ready():
	randomize()


func match_phase_of_attack() -> void:
	match current_phase_attack:
		AttackPhases.CIRCLE:
			projectile_circle(15, count)
		AttackPhases.SPIRAL:
			print("04ko")


func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func _on_stats_phase1():
	phase = 1 
	get_node("phase_wave_cd").start(0.01)#rand_range(0, 10))


func projectile_circle(amount, start):
	for i in range(0, amount, 1):
		var projectile_instance = projectile.instance()
		get_root.owner.call_deferred("add_child", projectile_instance)
		projectile_instance.transform =  get_root.global_transform
		#projectile_instance.rotation += get_node("../").get_angle_to(get_node("../crosshair").global_position)#???useless?
		projectile_instance.direction = (Vector2(sin(deg2rad(start + 360/amount * i)), cos(deg2rad(start + 360/amount * i))) )#- get_node("../").global_position).normalized() 
		projectile_instance.damage = stats.dmg


func _on_phase_wave_cd_timeout():
	if phase == 1 and ready:
		if count == 0:
			current_phase_attack = pick_random_phase_attack([AttackPhases.CIRCLE, AttackPhases.SPIRAL])
		print(count)
		if count < 80:
			match_phase_of_attack()
			count += 10 
			state = States.STOP
			get_node("phase_wave_cd").start(0.75)	
		else:
			state = States.IDLE
			get_node("phase_cd").start(rand_range(12, 20))
			ready = false
			count = 0


func _on_phase_cd_timeout():
	ready = true


func pick_random_phase_attack(attack_list):
	attack_list.shuffle()
	return attack_list.pop_front()
