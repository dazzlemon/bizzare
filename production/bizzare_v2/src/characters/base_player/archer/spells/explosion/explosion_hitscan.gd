class_name ExplosiveHitscan
extends BaseHitscanAlly

func _ready():
	try_use()


func _stop():
	queue_free()
