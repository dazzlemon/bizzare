class_name BaseNPCMeleeControl
extends BaseNPCControl


func _process(delta):
	._process(delta)
	if player_detection_zone.player != null and get_parent().global_position.distance_to(player_detection_zone.player.global_position) < 25:
		melee_attack()


func melee_attack():
	var player = player_detection_zone.player

	get_node("../attack").try_use()

