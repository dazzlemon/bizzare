#
class_name ArcherASboost
extends Node

var can_be_used := true


func try_use() -> void:
	if can_be_used == true:
		get_node("../attack")._INTERVAL = 0.25
		get_node("duration").start()
		can_be_used = false
		get_node("cd").start()


func _on_duration_timeout():
	get_node("../attack")._INTERVAL = 0.5


func _on_cd_timeout():
	can_be_used = true 
