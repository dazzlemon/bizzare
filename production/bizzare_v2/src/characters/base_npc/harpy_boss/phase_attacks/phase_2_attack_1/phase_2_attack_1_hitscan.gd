class_name Phase2Attack1Hitscan
extends BaseHitscanEnemy

func _ready():
	randomize()
	global_position += Vector2(rand_range(-150, 150), rand_range(-150, 150))
	get_node("charging").start()
	get_node("Position2D/AnimationPlayer").play("charging")


func _on_charging_timeout():
	get_node("duration").start()
	get_node("Position2D/hitbox/CollisionShape2D").disabled = false


func _on_duration_timeout():
	queue_free()
