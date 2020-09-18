class_name ExplosiveHitscan
extends BaseHitscanAlly

func _ready() -> void:
	try_use()
	get_node("AnimatedSprite").playing = true


func _stop() -> void:
	queue_free()
