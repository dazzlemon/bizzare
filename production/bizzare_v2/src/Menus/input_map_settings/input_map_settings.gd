extends CanvasLayer

onready var pause_menu = load("res://src/autoloads/Pause.tscn")
onready var settings_menu = load("res://src/Menus/settings/Settings.tscn")
onready var buttoncontainer = $VBoxContainer
onready var button_script = load("res://src/Menus/input_map_settings/KeyButton.gd")

var keybinds
var buttons = {}


func _ready():
	keybinds = InputMapSettings.keybinds.duplicate()
	for key in keybinds.keys():
		var hbox = HBoxContainer.new()
		var label = Label.new()
		var button = Button.new()
		hbox.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		label.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		button.set_h_size_flags(Control.SIZE_EXPAND_FILL)
		label.text = key
		var button_value = keybinds[key]
		if button_value != null:
			button.text = OS.get_scancode_string(button_value)
		else:
			button.text = "-"
		button.set_script(button_script)
		button.key = key
		button.value = button_value
		button.menu = self
		button.toggle_mode = true
		button.focus_mode = Control.FOCUS_NONE
		hbox.add_child(label)
		hbox.add_child(button)
		buttoncontainer.add_child(hbox)
		buttons[key] = button


func change_bind(key, value):
	keybinds[key] = value
	for k in keybinds.keys():
		if k != key and value != null and keybinds[k] == value:
			keybinds[k] = null
			buttons[k].value = null
			buttons[k].text = "-"



func _on_Back_pressed():
	Pause.call_deferred("add_child", settings_menu.instance())
	#Pause.set_visible(true)
	queue_free()



func _on_Save_pressed():
	InputMapSettings.keybinds = keybinds.duplicate()
	InputMapSettings.set_config()
	InputMapSettings.write_config()
	_on_Back_pressed()
