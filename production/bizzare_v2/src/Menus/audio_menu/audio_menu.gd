extends Control

onready var music_slider = $MusicSlider
onready var sound_slider = $SoundSlider
onready var menu = load("res://src/Menus/audio_menu/audio_menu.tscn")

func _ready():
	music_slider.value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	sound_slider.value = db2linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound")))


func _on_Back_pressed():
	get_node("../")._visible()
	queue_free()


func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), linear2db(value))
	InputMapSettings.write_sfx_to_config()



func _on_Sound_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), linear2db(value))
	InputMapSettings.write_sfx_to_config()



func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_on_Back_pressed()
