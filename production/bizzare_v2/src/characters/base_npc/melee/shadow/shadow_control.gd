class_name ShadowControl
extends BaseNPCMeleeControl

var critical := true
onready var default_damage = 1


func _ready():
	randomize()


func _process(delta):
	._process(delta)
	var player = playerDetectionZone.player
	if player != null and get_parent().global_position.distance_to(playerDetectionZone.player.global_position) < 25:
		melee_attack()

func melee_attack():
	var player = playerDetectionZone.player
	if player != null and get_node("../pivot/sprite").visible:
		get_node("../crosshair").global_position = player.global_position
		if critical: 
			var rng = RandomNumberGenerator.new()
			rng.randomize()
			get_node("../attack/hitbox").damage  = default_damage * rng.randi_range(10, 20)
			critical = false
		else: 
			get_node("../attack/hitbox").damage  = default_damage 
		print(get_node("../attack/hitbox").damage )
		get_node("../attack").try_use()
		
		
