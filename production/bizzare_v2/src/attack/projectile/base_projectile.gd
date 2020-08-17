#WIP
class_name BaseProjectile
extends RigidBody2D

export var damage = 1# idk float/int

var speed = 350# probably float
var LIFETIME = 2# same + has to be const but changeable in inherited
var direction: Vector2

func _ready():
	get_node("age").start(LIFETIME)


func _process(delta) -> void:
	global_position += direction * speed * delta


func _on_body_entered(_body) -> void:# rework, because currently it will only count hits int collisionBox, currently disconected
	die()


func die() -> void:
	queue_free()


func _on_age_timeout():
	die()
