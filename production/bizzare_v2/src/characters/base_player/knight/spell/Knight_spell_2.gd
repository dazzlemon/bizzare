extends Node

var E_skill_allowed = true

func try_use():
	if Input.is_action_pressed("spell_2") and E_skill_allowed == true:
		get_node("../").DMG_BLOCK = 0.3
		get_node("2_skill_duration").start()
		E_skill_allowed = false
		get_node("2_skill_cd").start()
		print(get_node("../").DMG_BLOCK)

func _on_2_skill_duration_timeout():
	get_node("../").DMG_BLOCK = 0
	print(get_node("../").DMG_BLOCK)

func _on_2_skill_cd_timeout():
	E_skill_allowed = true 


