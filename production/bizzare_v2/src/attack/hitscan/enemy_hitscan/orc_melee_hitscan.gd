class_name OrcMeleeHitscan
extends BaseHitscanEnemy

var is_attacked = true
onready var tween = get_node("../Tween")
onready var hands = get_node("../pivot/hands")

func _ready():
	_INTERVAL = 0.7


func _start() -> void:
	tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees + 120 , 0.35 , Tween.TRANS_SINE, Tween.EASE_IN , 0)
	tween.start()
	is_attacked = not is_attacked
	._start()


func _on_Tween_tween_completed(object, key):
	if is_attacked:
		is_attacked = not is_attacked
		tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees - 120 , 0.35 , Tween.TRANS_SINE, Tween.EASE_IN , 0)
