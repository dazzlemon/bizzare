class_name OrcMeleeHitscan
extends BaseHitscanEnemy

onready var tween = get_node("../Tween")
onready var hands = get_node("../pivot/hands")

func _ready():
	_INTERVAL = 0.4

#func _start() -> void:
#	#update_tween.interpolate_property(animation, "value", animation.value, stats.get(value_str), 0.175, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.175)
#	tween.interpolate_property(hands, "rotation_degrees",hands.rotation_degrees , hands.rotation_degrees + 30 , 0.4 ,  tween.TRANS_SINE , Tween.EASE_IN , 0.4)
#	._start()
#
#
#func _stop() -> void:
#	hitbox_collision.disabled = true
	
