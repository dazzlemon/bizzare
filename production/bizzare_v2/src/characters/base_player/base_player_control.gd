#base control(name is subject to change) class for all playable characters
class_name BasePlayerControl#mb rename
extends BaseControl

onready var spell_1 = get_node("../spell_1")
onready var spell_2 = get_node("../spell_2")
#onready var minimap = get_node("../Camera2D/minimap")
onready var actions = [
	"spell_1",
	"spell_2",
	"attack",
	"shift_dodge",
	#"minimap",
	#"ui_accept",
]

func _process(delta: float):
	input_loop()
	crosshair.global_position = get_global_mouse_position()
	._process(delta)


func input_loop():
	for action in actions:
		#if Input.is_action_pressed("ui_accept"):
			#	get_tree().get_root().get_node("Game").add_child(load("res://src/Menus/Debug_console/console.tscn").instance())
		if Input.is_action_pressed(action) and get(action) != null:
				get(action).try_use()


func get_input_vector() -> Vector2:
	var dir := Vector2.ZERO
	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	return dir.normalized()
