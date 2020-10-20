class_name MageProjectile
extends BaseProjectileAlly

onready var animation_player = $AnimationPlayer

func _ready():
	speed = 200
	damage = 10
	animation_player.play("process")
	rotation = get_angle_to(get_tree().get_root().get_node("Game/level/player/crosshair").global_position)
