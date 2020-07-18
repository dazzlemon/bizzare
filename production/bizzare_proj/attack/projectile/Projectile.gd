extends RigidBody2D

var speed = 800
var LIFETIME = 2
var age = 0

func _physics_process(delta):
	position += transform.x * speed * delta
	age += delta
	if age >= LIFETIME:
		queue_free()

func _on_Projectile_body_entered(body):
	#body.take_damage()
	queue_free()
