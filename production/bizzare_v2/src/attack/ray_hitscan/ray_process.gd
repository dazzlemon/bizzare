extends RayCast2D

onready var double_up = get_node("../../")

func _process(delta) -> void:
	cast_to = double_up.get_node("crosshair").global_position - double_up.global_position
	if enabled and double_up.get_node("../control/player_detection_zone").can_see_player():
		var player = double_up.get_node("../control/player_detection_zone").player
		if player is BaseChar:
			player.take_damage(5 * delta)
