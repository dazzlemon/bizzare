extends Area2D

export var damage = 1

func _on_hitbox_body_entered(body):
	body.take_damage(damage)
