class_name BossStats
extends BaseNPCStats

const phase_map = {1: 0.75, 2: 0.5, 3: 0.25}# % of health where phase x starts

onready var control = get_node("../control")

func health_set(value) -> void:
	.health_set(value)
	update_phase()


func update_phase() -> void:
	for phase in range(3, 0, -1):
		if phase_check(phase):
			get_node("../control").phase = phase
			return


func phase_check(phase) -> bool:
	return control.phase < phase and health <= max_health * phase_map.get(phase)
