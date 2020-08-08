class_name Phase2Attack2Hitscan
extends BaseHitscanEnemy



func _ready():
	randomize()
	get_node("duration").start()

func _on_duration_timeout():
	queue_free()
