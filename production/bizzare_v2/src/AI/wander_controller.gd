#class used in enemy npc's
#
#controlls their movement while their state is WANDER
class_name WanderController
extends Node2D

var wander_range: float = 64

onready var position_start: Vector2 = global_position
onready var position_target: Vector2 = global_position
onready var timer = $Timer

func _ready() -> void:
	update_target_position()


func _on_Timer_timeout() -> void:
	update_target_position()


func update_target_position() -> void:
	position_target = position_start + Vector2(wander_range(), wander_range())


func get_time_left() -> float:
	return timer.time_left


func start_wander_timer(duration: float) -> void:
	timer.start(duration)


func wander_range() -> float:
	return rand_range(-wander_range, wander_range)
