class_name AttackRange
extends Area2D

var player = null

onready var parent = get_parent()

func _on_area_entered(area: Area2D) -> void:
#area has to be character's hurtbox(set masks&layers for collisions)
	player = area.owner
	if parent.state != parent.States.DASH:
		parent.state = parent.States.ATTACK


func _on_area_exited(_area: Area2D) -> void:
	parent.state = Utility.pick_random([parent.States.IDLE, parent.States.WANDER])
	player = null
