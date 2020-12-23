#WIP
class_name BasePlayer 
extends BaseChar

onready var walk_audio_stream = $Sound/walk

func _process(delta):
	walk_audio_stream.stream_paused = velocity == Vector2.ZERO
