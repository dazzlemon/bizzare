class_name HarpyBossControl
extends BaseNPCRangeControl

var phase := 0 setget phase_set
var is_ready = true
var current_phase_attack
var roll = 0

func _ready():
	randomize()


func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func phase_set(phase_new: int):
	phase = phase_new
	get_node("phase_cd").start(rand_range(0, 5))# need play test


func _on_phase_cd_timeout():
	if is_ready:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		#roll = rng.randi_range(1, 2)
		roll = 2################################### DEBUG
		current_phase_attack = "phase_" + str(phase) + "_attack_" + str(roll)
		print(current_phase_attack)
		get_node(current_phase_attack + "/wave_interval").start()#every timer has own timings
		get_node("phase_attack_duration").start(6 + 1.01)#6 is subject to change prolly need to make it var, or mb need to make it own var for each attack


func _on_phase_attack_duration_timeout():
	get_node(current_phase_attack + "/wave_interval").stop()#idk if it sets time to 0(i guess it does)
