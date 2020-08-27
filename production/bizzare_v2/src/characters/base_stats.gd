# basic stats class that includes health + armor
#
# probably need to add damage there too
class_name BaseStats
extends Node

signal no_health

var max_health: float = 1# int/float?
var max_armor: float = 0# same

onready var health: float setget health_set
onready var armor: float setget armor_set
onready var damage: float = 1

func _ready():
	health = max_health
	armor = max_armor
	
func health_set(value: float) -> void:
	health = value
	if health <= 0:
		emit_signal("no_health")


func armor_set(value: float) -> void:
	if value < 0:
		health += value
		armor = 0
	else:
		armor = value
