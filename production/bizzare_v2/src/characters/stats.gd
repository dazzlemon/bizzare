extends Node

export var max_health = 1
onready var health = max_health setget set_health
export var max_armor = 0
onready var armor = max_armor setget set_armor

func set_armor(value):
	armor = value

func get_armor():
	return armor

signal no_health

func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")

func get_health():
	return health
