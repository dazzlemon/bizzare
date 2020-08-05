class_name HarpyBossControl
extends BaseNPCRangeControl

var projectile = preload("res://src/characters/base_npc/range/harpy_boss/attack/harpy_boss_projectile.tscn")

func wander() -> Vector2:
	state = States.IDLE
	return Vector2.ZERO


func _on_stats_phase1():
	phase1()


func phase1():
	for i in range(0, 18, 1):
		print(i)
		var projectile_instance = projectile.instance()
		get_node("../").owner.add_child(projectile_instance)
		projectile_instance.transform = get_node("../").global_transform
		#projectile_instance.rotation += get_node("../").get_angle_to(get_node("../crosshair").global_position)#???useless?
		projectile_instance.direction = (Vector2(sin(deg2rad(20 * i)), cos(deg2rad(20 * i))) )#- get_node("../").global_position).normalized() 
		projectile_instance.damage = get_node("../stats").dmg
