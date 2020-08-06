class_name BossStats
extends BaseNPCStats

signal phase1#mb rename these to represent that they switch state*****
signal phase2
signal phase3

const phase_map = {1: 0.75, 2: 0.5, 3: 0.25}# % of health where phase x starts

onready var control = get_node("../control")

func set_health(value) -> void:
	health = value
	if health <= 0:
		emit_signal("no_health")
	if not player_detection_zone.has_player_inside_fov() :
		emit_signal("damage_from_behind")
	update_phase()

func update_phase():
	for phase in range(3, 0, -1):
		if phase_check(phase):
			emit_signal("phase" + str(phase))
			return

func phase_check(phase) -> bool:
	return control.phase < phase and health <= max_health * phase_map.get(phase)
