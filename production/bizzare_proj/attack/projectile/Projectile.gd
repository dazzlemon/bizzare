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

func _on_Projectile_body_entered(body):
	#print("da kto etot wash ebaniy body?????!?!?!???!???")
	body.take_damage(damage)#da kto etot wash ebaniy body?????!?!?!???!???
	queue_free()