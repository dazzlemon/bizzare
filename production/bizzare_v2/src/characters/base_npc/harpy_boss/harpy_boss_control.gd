class_name HarpyBossControl
extends BaseNPCControl

var phase := 0 setget phase_set
var is_ready = true
var current_phase_attack
var roll = 0
var dash_target: Vector2
var dash_start: Vector2

var stomp = preload("res://src/characters/base_npc/harpy_boss/phase_attacks/phase_2_attack_2/harpy_stomp.tscn")

#func _ready() -> void:
#	randomize()


func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func dash() -> Vector2:
	if get_parent().global_position.distance_to(dash_target) <= 15 :
		get_node("../").state = get_node("../").States.FRICTION
		var stomp_instance = stomp.instance()
		get_node("../").call_deferred("add_child" , stomp_instance)
		state = States.IDLE
	return (dash_target - get_parent().global_position).normalized() * 4.5 # NEED PLAY TEST


func phase_set(phase_new: int) -> void:
	phase = phase_new
	get_node("phase_cd").start(rand_range(0, 2.5))# need play test


func _on_phase_cd_timeout() -> void:
	if is_ready and get_node("phase_3_attack_1").apprentices.empty():
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		roll = rng.randi_range(1, 2)
		roll = 1################################### DEBUG
		phase = 3################################## DEBUG
		current_phase_attack = "phase_" + str(phase) + "_attack_" + str(roll)
		print(current_phase_attack)
		get_node(current_phase_attack).try_use()


func phase_attack_ended() -> void:
	get_node("phase_cd").start(10)
	if attack_range.player != null:
		state = States.ATTACK
	else:
		state = States.CHASE
