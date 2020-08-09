class_name HarpyBossControl
extends BaseNPCRangeControl


var phase = 0
var is_ready = true
var current_phase_attack = null
var roll = 0 


func _ready():
	randomize()


func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func _on_stats_phase1():
	phase = 1 
	get_node("phase_cd").start(rand_range(0, 5)) # need play test


func _on_stats_phase2():
	phase = 2
	get_node("phase_cd").start(rand_range(0, 5)) # need play test


func _on_stats_phase3():
	phase = 3
	get_node("phase_cd").start(rand_range(0, 5)) # need play test


func _on_phase_cd_timeout():
	if is_ready:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		#roll = rng.randi_range(1, 2)
		roll = 2
		get_node("phase_" + str(phase) + "_attack_" + str(roll)).try_use()
