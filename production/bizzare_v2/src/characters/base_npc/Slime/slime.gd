class_name Slime
extends BaseNPC

onready var timer = $Timer
onready var sprite = $pivot/sprite
onready var slime = load("res://src/characters/base_npc/Slime/slime.tscn")

var count = 1
var jump_interval = 3
var jump_time = 0.35
var jump_delay = 0.5
var jump_height = -7


func _ready():
	MAX_SPEED = 75
	timer.start(jump_interval)
	stats.health /= count
	stats.max_health /= count
	#scale = scale - Vector2(0.25,0.25)


func _on_Timer_timeout():
	pass
	if control.state != control.States.ATTACK:
		tween.interpolate_property(sprite, "position:y", 0, jump_height, jump_time , Tween.TRANS_SINE, Tween.EASE_IN , 0)
		tween.interpolate_property(sprite, "position:y", jump_height, 0, jump_time , Tween.TRANS_SINE, Tween.EASE_IN , jump_delay)
		tween.start()


func die():
	if count < 4:
		for i in range(2):
			var instance = slime.instance()
			get_node("../").call_deferred("add_child", instance)
			instance.count = count * 2
			instance.global_position = global_position + Vector2(rand_range(0,20), rand_range(0,20))
			instance.scale = scale - Vector2(0.25,0.25)
	.die()
