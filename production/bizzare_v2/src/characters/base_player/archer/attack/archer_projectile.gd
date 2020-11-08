class_name ArcherProjectile
extends BaseProjectileAlly

func _ready():
	rotation = get_angle_to(get_node("../player/crosshair").global_position)
