#
class_name BaseProjectileAttack
extends SpellCd

var damage: float = 1
var projectile = preload("res://src/attack/projectile/base_projectile.tscn")

onready var level = get_tree().get_root().get_node("Game/level")#mb can switch to owner
onready var parent = get_parent()

func _ready() -> void:
	_INTERVAL = 0.5

func _start() -> void:
	var projectile_instance = projectile.instance()
	level.call_deferred("add_child", projectile_instance)
	projectile_instance.transform = parent.global_transform
	projectile_instance.direction = (parent.crosshair.global_position - parent.global_position).normalized()
	projectile_instance.damage = self.damage
