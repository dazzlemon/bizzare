extends RichTextLabel

onready var player = get_node("../../")
onready var stats = player.get_node("stats")
onready var spell1_cd = player.get_node("spell_1/cd")
onready var spell1_dur = player.get_node("spell_1/duration")
onready var spell2_cd = player.get_node("spell_2/cd")
onready var spell2_dur = player.get_node("spell_2/duration")

func _process(_delta) -> void:
	set_text("Class:" + str(Utility.get_typeof(player)) + "\n".c_unescape())
	add_text("HP:" + str(stats.health) + "\n".c_unescape())
	add_text("Armor:" + str(stats.armor) + "\n".c_unescape())
	add_text("Damage:" + str(stats.damage) + "\n".c_unescape())
	if spell1_dur != null:
		add_text("Spell_1_active:" + (str(stepify(spell1_dur.get_time_left(),0.01)) if player.spell_1 != null else "") + "\n".c_unescape())
	add_text("Spell_1_cd:" + (str(stepify(spell1_cd.get_time_left(),0.01)) if player.spell_1 != null else "") + "\n".c_unescape())
	add_text("Spell_2_active:" + (str(stepify(spell2_dur.get_time_left(),0.01)) if player.spell_2 != null else "") + "\n".c_unescape())
	add_text("Spell_2_cd:" + (str(stepify(spell2_cd.get_time_left(),0.01)) if player.spell_2 != null else "") + "\n".c_unescape())
	add_text("fps:" + str(Engine.get_frames_per_second()))
	
