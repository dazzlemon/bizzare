# basic stats class that includes health + armor
#
# probably need to add damage there too
class_name BaseStats
extends Node

signal no_health

var max_health: float = 1
var max_armor: float = 0
var health: float = 1 setget health_set
var armor: float setget armor_set
var damage: float = 1

func _ready():
	health = max_health
	armor = max_armor


func health_set(value: float) -> void:
	if value > max_health:
		health = max_health
	else:
		health = value
		if health <= 0:
			emit_signal("no_health")


func armor_set(value: float) -> void:
	if value < 0:
		health += value
		armor = 0
	elif value > max_armor:
		armor = max_armor
	else:
		armor = value
