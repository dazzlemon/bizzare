class_name BossStats
extends BaseNPCStats

signal phase1
signal phase2
signal phase3


func set_health(value) -> void:
	health = value
	if health <= 0:
		emit_signal("no_health")
	if not player_detection_zone.has_player_inside_fov() :
		emit_signal("damage_from_behind")
	#REWORK TO MAP
	if health > max_health * 0.5  and health <= max_health * 0.75:
		emit_signal("phase1")
	if health > max_health * 0.25  and health <= max_health * 0.5:
		emit_signal("phase2")
	if health > 0  and health <= max_health * 0.25:
		emit_signal("phase3")
