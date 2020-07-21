#WIP
class_name KnightDMGBlock
extends Node

var can_be_used := true

func _on_duration_timeout() -> void:
	get_node("../").DMG_BLOCK = 0
	print(get_node("../").DMG_BLOCK)#DEBUG______________________________


func _on_cd_timeout() -> void:
	can_be_used = true 


func try_use() -> void:
	if Input.is_action_pressed("spell_2") and can_be_used == true:#make it as interface func
		get_node("../").DMG_BLOCK = 0.3
		get_node("2_skill_duration").start()
		can_be_used = false
		get_node("2_skill_cd").start()
		print(get_node("../").DMG_BLOCK)#DEBUG__________________________
