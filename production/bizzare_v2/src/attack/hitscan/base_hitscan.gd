# basic hitscan attack
class_name BaseHitscan
extends Position2D

var ATTACK_DURATION_SEC := 0.25# has to be const actually but aswell has to be changeable in inherited classes
var ATTACK_INTERVAL := 0.15# same applies here

func try_use() -> void:
	if is_able_to_use():
		get_node("hitbox/CollisionShape2D").disabled = false
		get_node("cd").start(ATTACK_INTERVAL + ATTACK_DURATION_SEC)
		get_node("duration").start(ATTACK_DURATION_SEC)


func is_able_to_use() -> bool:
	return (get_node("cd").time_left == 0)


func _on_duration_timeout() -> void:
	get_node("hitbox/CollisionShape2D").disabled = true
