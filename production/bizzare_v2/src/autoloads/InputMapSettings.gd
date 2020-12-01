extends Node

onready var input_menu = load("res://src/Menus/input_map_settings/input_map_settings.tscn")
#onready var pause_menu = get_tree().get_root().get_node("/root/Pause")
var filepath = "res://key_config.ini"
var config

var keybinds = {}
var sfx = {}


func _show():
	add_child(input_menu.instance())


func _ready():
	config = ConfigFile.new()
	if config.load(filepath) == OK:
		for key in config.get_section_keys("keybinds"):
			var key_value = config.get_value("keybinds", key)
			if str(key_value) != "":
				keybinds[key] = key_value
			else:
				keybinds[key] = null
		for element in config.get_section_keys("SFX"):
			var sfx_value = config.get_value("SFX", element)
			if str(sfx_value) != "":
				sfx[element] = sfx_value
			else:
				sfx[element] = null
	else:
		print("Config file not found")
		get_tree().quit()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), sfx["music"])
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), sfx["sound"])
	set_config()


func set_config():
	for key in keybinds.keys():
		var value = keybinds[key]
		var actionlist = InputMap.get_action_list(key)
		if !actionlist.empty():
			InputMap.action_erase_event(key , actionlist[0]) ####Changing obly first action in list(Ex: (w, ->) changing only w)
		if value != null:
			var new_key = InputEventKey.new()
			new_key.set_scancode(value)
			InputMap.action_add_event(key, new_key)


func write_config():
	for key in keybinds.keys():
		var key_value = keybinds[key]
		if key_value != null:
			config.set_value("keybinds" , key, key_value)
		else:
			config.set_value("keybinds", key, "")  ###GODOT deletes the whole line in config if value = null , so value = ""
	config.set_value("SFX", "music" , AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Music")))
	config.set_value("SFX", "sound" , AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Sound")))
	config.save(filepath)

