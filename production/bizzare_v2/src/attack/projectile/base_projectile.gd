#WIP
class_name baseProjectile
extends RigidBody2D

var speed = 350# probably float
var LIFETIME = 5# same + has to be const but changeable in inherited
var age = 0# same
var direction: Vector2
export var damage = 1# idk float/int

func _process(delta):
	global_position += direction * speed * delta
	age += delta
	if age >= LIFETIME:
		queue_free()

func _on_body_entered(body):# rework, because currently it will only count hits int collisionBox, currently disconected
	body.take_damage(damage)
	queue_free()
