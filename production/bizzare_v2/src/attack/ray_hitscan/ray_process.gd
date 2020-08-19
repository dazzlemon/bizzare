class_name RayHitscanProcess
extends RayCast2D

onready var double_up = get_node("../../")
onready var crosshair = double_up.get_node("crosshair")
onready var player_detection_zone = double_up.get_node("../control/player_detection_zone")

func _process(delta) -> void:
	cast_to = crosshair.global_position - double_up.global_position
	if enabled and player_detection_zone.can_see_player():
		var player = player_detection_zone.player
		if player is BaseChar:
			player.take_damage(5 * delta)
