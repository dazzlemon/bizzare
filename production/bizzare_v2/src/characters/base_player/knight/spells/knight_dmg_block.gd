#WIP
#
#mb refactor to use only one timer
class_name KnightDMGBlock
extends Node

var can_be_used := true
onready var parent = get_node("../")

func _on_duration_timeout() -> void:
	parent.DMG_BLOCK = 0
	print(parent.DMG_BLOCK)#DEBUG______________________________


func _on_cd_timeout() -> void:
	can_be_used = true 


func try_use() -> void:
	if can_be_used == true:
		parent.DMG_BLOCK = 0.3
		get_node("duration").start()
		can_be_used = false
		parent.start()
		print(parent.DMG_BLOCK)#DEBUG__________________________
