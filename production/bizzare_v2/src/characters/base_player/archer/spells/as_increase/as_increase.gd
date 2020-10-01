#
class_name ArcherASboost
extends Node

var can_be_used := true
onready var particles = get_node("Particles2D")
onready var player = get_node("../")
onready var attack = get_node("../attack")
onready var attack_player

func try_use() -> void:
	if can_be_used == true:
		attack._INTERVAL = 0.275
		get_node("duration").start()
		can_be_used = false
		get_node("cd").start()
		particles.emitting = true
		get_node("../AttackPlayer").playback_speed = 2


func _on_duration_timeout() -> void:
	attack._INTERVAL = 0.525
	particles.emitting = false
	get_node("../AttackPlayer").playback_speed = 1


func _on_cd_timeout() -> void:
	can_be_used = true 


func _process(delta):
	particles.global_position = player.global_position
