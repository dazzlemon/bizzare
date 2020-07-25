extends RichTextLabel

const utility = preload("res://src/etc/utility.gd")

onready var player = get_node("../../")

func _process(delta):
	set_text ("Class:" + str(utility.get_typeof(get_node("../../"))))
	newline()
	
	add_text("HP:" + str(get_node("../../stats").get_health()))
	newline()
	
	add_text("Armor:" + str(get_node("../../stats").get_armor()))
	newline()
	
	add_text("Spell_1_active:" + (str(stepify(get_node("../../spell_1/duration").get_time_left(),0.01)) if player.spell_1 != null else ""))	
	newline()
	
	add_text("Spell_1_cd:" + (str(stepify(get_node("../../spell_1/cd").get_time_left(),0.01)) if player.spell_1 != null else ""))
	newline()
	
	add_text("Spell_2_active:" + (str(stepify(get_node("../../spell_2/duration").get_time_left(),0.01)) if player.spell_2 != null else ""))
	newline()
	
	add_text("Spell_2_cd:" + (str(stepify(get_node("../../spell_2/cd").get_time_left(),0.01)) if player.spell_2 != null else ""))
	newline()
	
	add_text("fps:" + str(Engine.get_frames_per_second()))

