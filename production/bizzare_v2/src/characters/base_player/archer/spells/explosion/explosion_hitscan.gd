class_name ExplosiveHitscan
extends BaseHitscanAlly

var damage

func _ready() -> void:
	try_use()
	get_node("AnimatedSprite").playing = true


func _stop() -> void:
	queue_free()


func get_damage():
	return damage
