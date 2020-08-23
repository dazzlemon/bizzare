class_name ExplosiveHitscan
extends BaseHitscanAlly

func _ready() -> void:
	try_use()


func _stop() -> void:
	queue_free()
