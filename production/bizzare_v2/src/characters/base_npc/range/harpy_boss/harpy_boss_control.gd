class_name HarpyBossControl
extends BaseNPCRangeControl


var phase = 0
var wave_count = 0
var is_ready = true
var current_phase_attack = null
var step = 10
var interval = 0
var lightning_angle = 0

enum AttackPhases{
	CIRCLE,
	SPIRAL,
	LIGHTNING,
	LIGHTNING_CIRCLE,
}


func _ready():
	randomize()


func match_phase_of_attack() -> void:
	match current_phase_attack:
		AttackPhases.CIRCLE:
			get_node("phase_1_attack_1").projectile_circle(15, wave_count)
		AttackPhases.SPIRAL:
			get_node("phase_1_attack_2").projectile_spiral(10)
		AttackPhases.LIGHTNING:
			get_node("phase_2_attack_1").hitscan_lightning(24,lightning_angle)
		AttackPhases.LIGHTNING_CIRCLE:
			get_node("phase_2_attack_2").itscan_lightning_circle(24,lightning_angle)


func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func _on_stats_phase1():
	phase = 1 
	get_node("phase_wave_cd").start(rand_range(0, 5)) # need play test


func _on_stats_phase2():
	phase = 2
	get_node("phase_wave_cd").start(rand_range(0, 5)) # need play test


func _on_stats_phase3():
	phase = 3
	get_node("phase_wave_cd").start(rand_range(0, 5)) # need play test


func _on_phase_cd_timeout():
	is_ready = true


func pick_random_phase_attack(attack_list):
	attack_list.shuffle()
	return attack_list.pop_front()


func _on_phase_wave_cd_timeout():
	if phase == 1 and is_ready:
		if wave_count == 0:
			current_phase_attack = pick_random_phase_attack([AttackPhases.CIRCLE, AttackPhases.SPIRAL])
		print(wave_count)
		if wave_count < 80:
			match_phase_of_attack()
			wave_count += step
			state = States.STOP
			get_node("phase_wave_cd").start(interval)	
		else:
			state = States.IDLE
			get_node("phase_cd").start(rand_range(12, 20))
			is_ready = false
			wave_count = 0
	if phase == 2 and is_ready:
		if wave_count == 0:
			current_phase_attack = pick_random_phase_attack([AttackPhases.LIGHTNING, AttackPhases.LIGHTNING_CIRCLE])
		print(wave_count)
		if wave_count < 80:
			match_phase_of_attack()
			wave_count += step
			state = States.STOP
			get_node("phase_wave_cd").start(interval)	
		else:
			state = States.IDLE
			get_node("phase_cd").start(rand_range(12, 20))
			is_ready = false
			wave_count = 0







