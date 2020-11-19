#
class_name BaseProjectileAttack
extends SpellCd

var projectile = preload("res://src/attack/projectile/base_projectile.tscn")

onready var level = get_node("../../")
onready var parent = get_parent()
onready var stats = get_node("../stats")

func _ready() -> void:
	_INTERVAL = 0.5

func _start() -> void:
	var projectile_instance = projectile.instance()
	level.call_deferred("add_child", projectile_instance)
	projectile_instance.global_position = parent.global_position
	projectile_instance.direction = (parent.crosshair.global_position - global_position).normalized()
	projectile_instance.damage = stats.damage
