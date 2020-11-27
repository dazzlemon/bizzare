extends CanvasLayer

onready var input = $input
onready var output = $output
onready var command_handler = $command_handler

var command_history_line = command_history.history.size()


func _ready() -> void:
	set_visible(false)


func output_text(text):
	output.text = str(output.text, "\n", text)
	output.set_v_scroll(9999999)


func _input(event) -> void:
	if event.is_action_pressed("console"):
		Pause.is_settings_shown = not Pause.is_settings_shown
		get_tree().paused = not get_tree().paused
		set_visible(get_tree().paused)
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_UP:
			scroll_command_history(-1)
		if event.scancode == KEY_DOWN:
			scroll_command_history(1)


func scroll_command_history(amount):
	command_history_line += amount
	command_history_line = clamp(command_history_line, 0, command_history.history.size())
	if command_history_line < command_history.history.size() and command_history.history.size() > 0:
		input.text = command_history.history[command_history_line]
		input.call_deferred("set_cursor_position", 9999999)


func proccess_comand(text):
	var words = text.split(" ",false)
	words = Array(words)
	if words.size() == 0:
		return
	command_history.history.append(text)
	var command_word = words.pop_front()
	for c in command_handler.commands:
		if c[0] == command_word:
			#print(str("c0:" + c[0]))
			#print(str("cw:" + command_word))
			if words.size() != c[1].size():
				output_text(str('Failed to use command "', command_word, '", expected ', c[1].size() , ' parameters'))
				return
			for i in range(words.size()):
				if not check_type(words[i], c[1][i]):
					output_text(str('Failed to use command "', command_word, '", parameter ', (i+1), '("', words[i], '") is of the wrong type'))
					return
			if "health" in command_word or "armor" in command_word or "damage" in command_word:
				output_text(command_handler.call("set_value", command_word, words)) 
			else:
				output_text(command_handler.callv(command_word, words))
			return
	output_text(str('Command "', command_word, '" does not exist.'))


func check_type(string, type):
	if type == command_handler.INT:
		return string.is_valid_integer()
	if type == command_handler.FLOAT:
		return string.is_valid_float()
	if type == command_handler.STRING:
		return true
	if type == command_handler.BOOL:
		return(string == "true" or string == "false")
	return false


func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible
	if is_visible:
		input.grab_focus()


func _on_input_text_entered(new_text):
	proccess_comand(new_text)
	input.clear()
	command_history_line = command_history.history.size()

