# basic stats class that includes health + armor
#
# probably need to add damage there too
class_name baseStats
extends Node

signal no_health

export var max_health = 1# int/float?
export var max_armor = 0# same

onready var health = max_health setget set_health# same
onready var armor = max_armor setget set_armor# same

func set_armor(value) -> void:
	armor = value


func get_armor():
	return armor


func set_health(value) -> void:
	health = value
	if health <= 0:
		emit_signal("no_health")


func get_health():
	return health
