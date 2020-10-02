class_name RayHitscan
extends SpellCdDuration

onready var ray = $RayCast2D 
onready var sprite = $Sprite
onready var apprentice = get_node("../")

func _ready() -> void:
	_DURATION = 0.25
	_INTERVAL = 0.5


func _start() -> void:
	ray.enabled = true


func _stop() -> void:
	ray.enabled = false


func _process(delta):
	sprite.rotation = ray.cast_to.angle()
	if ray.is_colliding():
		sprite.region_rect.end.x = (ray.get_collider().global_position).length()
	else:
		sprite.region_rect.end.x = 200
	#._process(delta)
