class_name ArcherProjectile
extends BaseProjectileAlly

func _ready():
	damage = 5
	rotation = get_angle_to(get_tree().get_root().get_node("Game/level/player/crosshair").global_position)
