#
class_name ArcherASboost
extends Node

var can_be_used := true
onready var particles = get_node("Particles2D")
onready var player = get_node("../")

func try_use() -> void:
	if can_be_used == true:
		get_node("../attack")._INTERVAL = 0.25
		get_node("duration").start()
		can_be_used = false
		get_node("cd").start()
		particles.emitting = true


func _on_duration_timeout() -> void:
	get_node("../attack")._INTERVAL = 0.5
	particles.emitting = false


func _on_cd_timeout() -> void:
	can_be_used = true 


func _process(delta):
	particles.global_position = player.global_position
