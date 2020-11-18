class_name ShiftDodge
extends SpellCdDuration


var alpha = [0.5, 1]#start, stop

#onready var sprite = get_node("../pivot/sprite")
onready var hurtbox_collision = get_node("../hurtbox/CollisionShape2D")
#onready var hands = get_node("../pivot/hands")
onready var pivot = get_node("../pivot")

func _ready():
	_INTERVAL = 3
	_DURATION = 0.25


func _start():
	_toggle()


func _stop():
	_toggle()


func _toggle():
	pivot.modulate.a = alpha[int(hurtbox_collision.disabled)]
	#sprite.modulate.a = alpha[int(hurtbox_collision.disabled)]
	#hands.modulate.a = sprite.modulate.a
	hurtbox_collision.disabled = not hurtbox_collision.disabled
