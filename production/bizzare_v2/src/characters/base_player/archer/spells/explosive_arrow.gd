class_name ExplosiveArrow
extends BaseProjectileAttackAlly



func _ready():
	projectile = preload("res://src/characters/base_player/archer/spells/explosive_arrow_projectile.tscn")


func _on_duration_timeout():
	pass 


func _on_cd_timeout():
	pass # Replace with function body.


func update_state():
	var projectile_instance = projectile.instance()
	get_node("../").owner.add_child(projectile_instance)
	projectile_instance.transform = get_node("../").global_transform
	projectile_instance.rotation += get_node("../").get_angle_to(get_global_mouse_position())
	projectile_instance.direction = (get_global_mouse_position() - get_node("../").global_position).normalized()
	#.update_state()
	projectile_instance.parent_control = self
