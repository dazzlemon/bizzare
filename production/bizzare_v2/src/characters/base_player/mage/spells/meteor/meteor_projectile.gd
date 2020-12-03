extends ExplosiveArrowProjectile 

onready var animation_player = $AnimationPlayer
var target 

func _ready():
	animation_player.play("process")


func _on_body_entered(_body) -> void:
	pass


func _on_age_timeout():
	pass


func _process(delta):
	if global_position.distance_to(target) <= 15:
		die()
