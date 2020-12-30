class_name HarpyProjectile
extends BaseProjectileEnemy

var angle_coeffitient = 500
onready var player = get_node("../player")#get_tree().get_root().get_node("Game/level").player

func _ready():
	speed = 100
	LIFETIME = 10


func _process(delta):
	direction_update(delta)
	._process(delta)


func direction_update(delta):
	if player != null:
		var dir_to_player = (player.global_position - global_position).normalized()
		direction = direction.move_toward(dir_to_player, angle_coeffitient * delta).normalized()
