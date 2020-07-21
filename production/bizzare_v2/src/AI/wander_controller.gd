#class used in enemy npc's
#
#controlls their movement while their state is WANDER
class_name wanderController
extends Node2D

export(int) var wander_range = 64

onready var start_position: Vector2 = global_position
onready var target_position: Vector2 = global_position
onready var timer = $Timer#static typing?

func _ready() -> void:
	update_target_position()


func _on_Timer_timeout() -> void:
	update_target_position()


func update_target_position() -> void:
	var target_vector := Vector2(rand_range(-wander_range,wander_range), rand_range(-wander_range,wander_range))
	target_position = start_position + target_vector


func get_time_left():#idk what is return type, will add static typing later
	return timer.time_left


func start_wander_timer(duration) -> void:
	timer.start(duration)
