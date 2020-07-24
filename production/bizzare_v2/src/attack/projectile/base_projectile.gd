#WIP
class_name BaseProjectile
extends RigidBody2D

export var damage = 10# idk float/int

var speed = 350# probably float
var LIFETIME = 2# same + has to be const but changeable in inherited
var age = 0# same#prolly rework for timer
var direction: Vector2

func _process(delta) -> void:
	global_position += direction * speed * delta
	age += delta
	if age >= LIFETIME:
		queue_free()


func _on_body_entered(_body) -> void:# rework, because currently it will only count hits int collisionBox, currently disconected
	die()


func die() -> void:
	queue_free()
