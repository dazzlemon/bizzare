class_name KnightHitscan
extends BaseHitscanAlly

var is_attacked = true
onready var tween = get_node("../Tween")
onready var hands = get_node("../pivot/hands")
onready var melee_effect = hands.get_node("AnimatedSprite")

func _ready():
	_INTERVAL = 0.5

func _start() -> void:
	tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees + 90 , 0.15 , Tween.TRANS_SINE, Tween.EASE_IN , 0)
	tween.start()
	toggle()
	._start()


func _on_Tween_tween_completed(object, key):
	if is_attacked:
		toggle()
		tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees - 90 , 0.35 , Tween.TRANS_SINE, Tween.EASE_IN , 0)


func toggle():
	melee_effect.frame = 0
	#melee_effect.visible = not melee_effect.visible
	melee_effect.playing = not melee_effect.playing 
	is_attacked = not is_attacked

