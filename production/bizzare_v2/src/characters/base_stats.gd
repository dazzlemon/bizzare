# basic stats class that includes health + armor
#
# probably need to add damage there too
class_name BaseStats
extends Node

signal no_health


export var max_health: float = 1# int/float?
export var max_armor = 0# same


onready var health: float = max_health setget set_health# same
onready var armor = max_armor setget set_armor# same
onready var dmg = 1 setget set_dmg

func set_armor(value) -> void:#idk static type?
	armor = value


func get_armor():
	return armor


func set_health(value) -> void:# same
	health = value
	if health <= 0:
		emit_signal("no_health")


func get_health():
	return health


func set_dmg(value) -> void:
	dmg = value


func get_dmg():
	return dmg
