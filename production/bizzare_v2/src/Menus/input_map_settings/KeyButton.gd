extends Button


var key
var value
var menu

var is_waiting_input = false

func _input(event):
	if is_waiting_input:
		if event is InputEventKey:
			value = event.scancode
			text = OS.get_scancode_string(value)
			menu.change_bind(key, value)
			switch()
		if event is InputEventMouseButton:
			if value != null:
				text = OS.get_scancode_string(value)
			else:
				text = "-"
			switch()


func _toggled(is_button_pressed):
	if is_button_pressed:
		is_waiting_input = true
		set_text("Press any key")


func switch():
	
	pressed = false
	is_waiting_input = false
