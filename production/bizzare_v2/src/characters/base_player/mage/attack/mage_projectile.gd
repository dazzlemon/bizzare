class_name MageProjectile
extends BaseProjectileAlly

onready var animation_player = $AnimationPlayer

func _ready():
	speed = 200
	animation_player.play("process")
	rotation = get_angle_to(get_node("../player/crosshair").global_position)
