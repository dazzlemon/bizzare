#WIP
class_name BasePlayer 
extends BaseChar

onready var walk_audio_stream = $Sound/walk

#func _process(delta):
#	if control.get_input_vector() == Vector2.ZERO :
#		walk_audio_stream.stream_paused = true
func _process(delta):
	walk_audio_stream.stream_paused = velocity == Vector2.ZERO

#func _input(event):
#	if event.is_action_pressed("ui_down") or event.is_action_pressed("ui_left") or event.is_action_pressed("ui_up") or event.is_action_pressed("ui_right") :
#		walk_audio_stream.stream_paused = false
