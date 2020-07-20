extends RigidBody2D

var speed = 350
var LIFETIME = 5
var age = 0
var direction
export var damage = 1

func _process(delta):
	global_position += direction * speed * delta
	age += delta
	if age >= LIFETIME:
		queue_free()

func _on_projectile_body_entered(body):
	body.take_damage(damage)
	queue_free()
