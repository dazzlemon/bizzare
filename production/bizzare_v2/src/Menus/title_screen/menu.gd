class_name Menu
extends Panel

class Menu_Button:
	func _init(menu_str, func_str):
		self.menu_str = menu_str
		self.func_str = func_str
	var menu_str#printed on the button
	var func_str#call_deferred(func_str)

var buttons: Array
var separation = 0
var button_ref: Array#references to actual buttons

onready var vbox = $VBoxContainer

func _ready():
	vbox.add_constant_override("separation", separation)
	for button in buttons:
		var new_button = Button.new()
		new_button.text = button.menu_str
		new_button.size_flags_horizontal = SIZE_FILL#fill
		new_button.size_flags_vertical = SIZE_EXPAND_FILL#fill expand
		vbox.call_deferred("add_child", new_button)
		new_button.connect("pressed", self, button.func_str)
		button_ref.push_back(new_button)
