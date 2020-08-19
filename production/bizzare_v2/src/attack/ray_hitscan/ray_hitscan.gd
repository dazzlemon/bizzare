class_name RayHitscan
extends SpellCdDuration

onready var ray = $RayCast2D 


func _ready():
	_DURATION = 0.25
	_INTERVAL = 0.5


func _start():
	ray.enabled = true


func _stop():
	ray.enabled = false
