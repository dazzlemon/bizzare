class_name GoblinProjectile
extends BaseProjectileEnemy

func _ready():
	#damage = 5
	rotation += get_angle_to(get_tree().get_root().get_node("Game/level/orc_range/crosshair").global_position) 
