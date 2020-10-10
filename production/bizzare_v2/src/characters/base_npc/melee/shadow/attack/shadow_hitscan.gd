class_name ShadowHitscan
extends BaseHitscanEnemy

var change_hand = false
onready var tween = get_node("../Tween")
onready var hands = get_node("../pivot/hands")
onready var left_hand = get_node("../pivot/left_hand")
onready var attack_player = get_node("../AttackPlayer")

func _ready():
	_DURATION = 0.275
	_INTERVAL = 0


func _start() -> void:
	if change_hand:
		attack_player.play("right_hand")
		change_hand = not change_hand
	else:
		attack_player.play("left_hand")
		change_hand = not change_hand
	._start()



