extends RichTextLabel

onready var player = get_node("../../")
onready var spell1_dur = get_node("../../spell_1/duration")

func _process(_delta):#temporary so i wont even bother refactoring it
	set_text ("Class:" + str(Utility.get_typeof(get_node("../../"))) + "\n".c_unescape())
	add_text("HP:" + str(get_node("../../stats").health) + "\n".c_unescape())
	add_text("Armor:" + str(get_node("../../stats").armor) + "\n".c_unescape())
	add_text("Damage:" + str(get_node("../../stats").dmg) + "\n".c_unescape())
	if spell1_dur != null:
		add_text("Spell_1_active:" + (str(stepify(spell1_dur.get_time_left(),0.01)) if player.spell_1 != null else "") + "\n".c_unescape())
	add_text("Spell_1_cd:" + (str(stepify(get_node("../../spell_1/cd").get_time_left(),0.01)) if player.spell_1 != null else "") + "\n".c_unescape())
	add_text("Spell_2_active:" + (str(stepify(get_node("../../spell_2/duration").get_time_left(),0.01)) if player.spell_2 != null else "") + "\n".c_unescape())
	add_text("Spell_2_cd:" + (str(stepify(get_node("../../spell_2/cd").get_time_left(),0.01)) if player.spell_2 != null else "") + "\n".c_unescape())
	add_text("fps:" + str(Engine.get_frames_per_second()))
