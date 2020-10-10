#WIP
class_name BaseProjectile
extends RigidBody2D

export var damage = 1# idk float/int

var speed = 350# probably float
var LIFETIME = 2# same + has to be const but changeable in inherited
var direction: Vector2

func _ready():
	$age.start(LIFETIME)
	global_position += direction * 6 #* 24



func _process(delta) -> void:
	global_position += direction * speed * delta


func _on_body_entered(_body) -> void:
	die()


func die() -> void:
	queue_free()


func _on_age_timeout():
	die()
