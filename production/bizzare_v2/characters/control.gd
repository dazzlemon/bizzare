extends Control

onready var crosshair = get_node("../crosshair")
onready var attack = get_node("../attack")

func _process(_delta):
	crosshair.set_g_pos(get_global_mouse_position())
	if(attack != null):
		var body_cross_dir = attack.get_angle_to(crosshair.global_position)
		attack.rotation += body_cross_dir
	
	#better copy rotation in spell's processing, not there
	#var spell_1 = get_node("../spell_1")
	#var body_cross_dir_q_spell = spell_1.get_angle_to(get_global_mouse_position())
	#spell_1.rotation += body_cross_dir_q_spell
