class_name OrcCrosshair
extends Crosshair

onready var tween = get_node("../Tween")
onready var control = get_node("../control")

func _process(delta):
	if owner.velocity != Vector2.ZERO:
		global_position = owner.global_position + owner.velocity.normalized()
	elif control.player_detection_zone.can_see_player():
		global_position = control.player_detection_zone.player.global_position
	else:
		pass
	._process(delta)

#func _physics_process(delta):
#	pass
