class_name ShadowHitscan
extends BaseHitscanEnemy

var critical := true
var change_hand = false
var default_damage = 1
var is_attacked = true


onready var pivot = get_node("../pivot")
onready var hands = pivot.get_node("hands")
onready var tween = get_node("../Tween")

func _ready():
	_INTERVAL = 0.5


func _process(delta):
	critical = not pivot.visible


func _start() -> void:
	tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees + 120 , 0.2 , Tween.TRANS_SINE, Tween.EASE_IN , 0)
	tween.start()
	is_attacked = not is_attacked
	._start()


func _on_Tween_tween_completed(object, key):
	if is_attacked:
		is_attacked = not is_attacked
		tween.interpolate_property(hands, "rotation_degrees", hands.rotation_degrees , hands.rotation_degrees - 120 , 0.3 , Tween.TRANS_SINE, Tween.EASE_IN , 0) #0.39 cause 0.4 sometimes triggers twice


func crit_test():
	if critical:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		damage = default_damage * rng.randi_range(10, 20)
		critical = false
	else:
		damage = default_damage 
