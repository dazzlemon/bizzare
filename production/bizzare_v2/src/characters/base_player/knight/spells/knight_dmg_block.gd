#WIP
#
#mb refactor to use only one timer
class_name KnightDMGBlock
extends Node

var can_be_used := true

func _on_duration_timeout() -> void:
	get_node("../").DMG_BLOCK = 0
	print(get_node("../").DMG_BLOCK)#DEBUG______________________________


func _on_cd_timeout() -> void:
	can_be_used = true 


func try_use() -> void:
	if can_be_used == true:
		get_node("../").DMG_BLOCK = 0.3
		get_node("duration").start()
		can_be_used = false
		get_node("cd").start()
		print(get_node("../").DMG_BLOCK)#DEBUG__________________________
