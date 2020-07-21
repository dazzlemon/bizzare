extends "res://src/characters/base_player/control.gd"

func _process(delta):
	._process(delta)
	var spell_1 = get_node("../spell_1")
	var body_cross_dir_q_spell = spell_1.get_angle_to(get_global_mouse_position())
	spell_1.rotation += body_cross_dir_q_spell
