class_name ArcherProjectileAttack
extends BaseProjectileAttackAlly

func _ready():
	damage = get_node("../stats").dmg
