class_name GoblinProjectile
extends BaseProjectileEnemy

func _ready():
	rotation += get_angle_to(get_node("../orc_range/crosshair").global_position) 
	speed = 200
	self.damage = 1
