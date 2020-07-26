class_name ExplosiveHitscan
extends BaseHitscanAlly

func _ready():
	get_node("duratiion").start(0.25)


func _on_duratiion_timeout():
	queue_free()
