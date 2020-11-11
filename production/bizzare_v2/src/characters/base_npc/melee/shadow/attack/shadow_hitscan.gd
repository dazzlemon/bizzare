class_name ShadowHitscan
extends BaseHitscanEnemy

var critical := true
var change_hand = false
var default_damage = 1

onready var hands = get_node("../pivot/hands")
onready var left_hand = get_node("../pivot/left_hand")
onready var attack_player = get_node("../AttackPlayer")
onready var sprite = get_node("../pivot/sprite")


func _ready():
	_DURATION = 0.275
	_INTERVAL = 0


func _process(delta):
	critical = not sprite.visible


func _start() -> void:
	if change_hand:
		attack_player.play("right_hand")
		change_hand = not change_hand
	else:
		attack_player.play("left_hand")
		change_hand = not change_hand
	crit_test()
	._start()


func crit_test():
	if critical:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		damage = default_damage * rng.randi_range(10, 20)
		critical = false
	else:
		damage = default_damage 
