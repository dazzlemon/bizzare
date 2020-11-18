class_name CharacterAnimationTree
extends AnimationTree

class Animations:
	var idle: bool
	var run: bool
	func _init(idle, run):
		self.idle = idle
		self.run = run


var unit_type = Animations.new(true, false)

onready var crosshair = get_node("../crosshair")
onready var parent = get_parent()

func _animation_process(input_vector):
	var animation = "run" if input_vector != Vector2.ZERO else "idle"
	var blend_pos = (crosshair.global_position - parent.global_position).normalized()
	_blend_travel(animation, blend_pos)


func _blend_travel(animation: String, blend_pos):
	if not unit_type.get(animation):
		animation = "idle"
	var p = "parameters/"
	self[p + animation + "/blend_position"] = blend_pos
	get(p + "playback").travel(animation)
