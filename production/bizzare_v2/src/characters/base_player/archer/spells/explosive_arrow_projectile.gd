class_name ExplosiveArrowProjectile 
extends BaseProjectileAlly

var parent_control 


func _on_Area2D_body_entered(body):
	get_node("Area2D/CollisionShape2D").disabled = false

