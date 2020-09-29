class_name ShiftDodge
extends SpellCdDuration

var color_start = Color(1, 1, 1, 0.5)#opacity = 0.5
var color_stop = Color(1, 1, 1, 1)#opacity = 1

onready var sprite = get_node("../pivot/sprite")
onready var hurtbox_collision = get_node("../hurtbox/CollisionShape2D")
onready var hands = get_node("../pivot/hands")

func _ready():
	_INTERVAL = 3
	_DURATION = 0.25


func _start():
	_toggle()


func _stop():
	_toggle()


func _toggle():
	hurtbox_collision.disabled = not hurtbox_collision.disabled
	sprite.modulate = color_start if hurtbox_collision.disabled else color_stop
	hands.modulate = sprite.modulate
