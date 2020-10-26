class_name Consumable
extends KinematicBody2D

onready var tween = $Tween
onready var sprite = $area/sprite
var speed 
const DECEL = 500


func _ready():
	tween.interpolate_property(sprite, "position:y", 0, -3, 1 ,Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property(sprite, "position:y", -3, 0, 1 ,Tween.TRANS_SINE, Tween.EASE_IN_OUT, 1)
	tween.start()

	var rng = RandomNumberGenerator.new()
	rng.randomize()
	speed = Vector2(300, 300)#rng.randf_range(-100, 100), rng.randf_range(-100, 100))

func _physics_process(delta):
	speed = speed.move_toward(Vector2.ZERO, DECEL * delta)
	var col = move_and_slide(speed)
	#if col:
	#	speed = Vector2.ZERO#otherwise it doesnt work


func _on_area_entered(area):
	if area.owner is BasePlayer:
		die(area)
		queue_free()

func die(area):
	pass#area.use_consumable(self)
