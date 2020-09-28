class_name ShadowControl
extends BaseNPCMeleeControl

var critical := true

onready var default_damage = 1

func _process(delta):
	._process(delta)
	if player_detection_zone.player != null and get_parent().global_position.distance_to(player_detection_zone.player.global_position) < 25:
		melee_attack()

func melee_attack():
	var player = player_detection_zone.player
	if player != null and get_node("../pivot/sprite").visible:
		get_node("../crosshair").global_position = player.global_position
		if get_node("../attack/Position2D/hitbox/CollisionShape2D").disabled:#if get_node("../attack/duration").time_left == 0:
			crit_test()
		get_node("../attack").try_use()


func crit_test():
	if critical:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		get_node("../attack/Position2D/hitbox").damage = default_damage * rng.randi_range(10, 20)
		critical = false
	else:
		get_node("../attack/Position2D/hitbox").damage = default_damage 
	
