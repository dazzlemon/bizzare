class_name RayHitscan
extends SpellCdDuration

onready var ray = $RayCast2D
onready var apprentice = get_node("../")

func _ready() -> void:
	_DURATION = 0.25
	_INTERVAL = 0.6


func _start() -> void:
	ray.enabled = true


func _stop() -> void:
	ray.enabled = false
