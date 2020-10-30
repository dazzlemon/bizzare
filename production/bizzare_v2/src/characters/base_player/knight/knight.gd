#
class_name Knight
extends BasePlayer


func _ready():
	MAX_SPEED = 175
	unit_type = Animations.new(1, 1)#"idle_run"
