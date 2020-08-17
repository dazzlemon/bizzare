class_name HarpyProjectile
extends BaseProjectileEnemy

var angle_coeffitient = 500

func _ready():
	speed = 50
	LIFETIME = 10


func _process(delta):
	direction_update(delta)
	._process(delta)


func direction_update(delta):
	var player = get_node("../player")
	if player != null:
		var dir_to_player = (player.global_position - global_position).normalized()
		direction = direction.move_toward(dir_to_player, angle_coeffitient * delta).normalized()


func _on_update_timeout():
	pass
