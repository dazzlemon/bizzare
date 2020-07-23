extends RichTextLabel

func _physics_process(delta):
	set_text("Class:" + str(get_node("../../").name_))
	newline()
	add_text("HP:" + str(get_node("../../stats").get_health()))
	newline()
	add_text("Armor:" + str(get_node("../../stats").get_armor()))
	newline()
	add_text("Spell_1_active:"+ str(stepify(get_node("../../spell_1/duration").get_time_left(),0.01)))
	newline()
	add_text("Spell_1_cd:" + str(stepify(get_node("../../spell_1/cd").get_time_left(),0.01)))
	newline()
	add_text("Spell_2_active:" + str(stepify(get_node("../../spell_2/duration").get_time_left(),0.01)))
	newline()
	add_text("Spell_2_cd:" + str(stepify(get_node("../../spell_2/cd").get_time_left(),0.01)))
	newline()

