class_name Consumable
extends KinematicBody2D

onready var tween = $Tween
onready var sprite = $area/sprite

func _ready():
	tween.interpolate_property(sprite, "position:y", 0, -3, 1 ,Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property(sprite, "position:y", -3, 0, 1 ,Tween.TRANS_SINE, Tween.EASE_IN_OUT, 1)
	tween.start()


func _on_area_entered(area):
	die(area)
	queue_free()

func die(area):
	pass#area.use_consumable(self)
	
