#WIP
class_name KnightControl
extends BasePlayerControl

func _process(delta: float) -> void:
	._process(delta)
	var spell_1 = get_node("../spell_1")
	spell_1.rotation += spell_1.get_angle_to(get_node("../crosshair").global_position)
