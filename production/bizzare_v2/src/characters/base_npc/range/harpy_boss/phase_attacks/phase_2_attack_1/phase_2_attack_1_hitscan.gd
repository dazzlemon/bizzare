class_name Phase2Attack1Hitscan
extends BaseHitscanEnemy


func _ready():
	get_node("charging").start()


func _on_charging_timeout():
	get_node("duration").start()
	get_node("hitbox/CollisionShape2D").disabled =false


func _on_duration_timeout():
	queue_free()
