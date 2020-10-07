class_name OrcMeleeHands
extends BaseHands


onready var crosshair = get_node("../../crosshair")

func _ready():
	start_angle = 0#-30


func _process(delta):
	if not tween.is_active():
		if control.player_detection_zone.can_see_player():
			rotation += get_angle_to(get_owner().crosshair.global_position) + start_angle
			crosshair.global_position = control.player_detection_zone.player.global_position
		else:
			rotation += get_angle_to(get_owner().crosshair.global_position)
			#(crosshair.global_position - global_position).normalized()
			crosshair.global_position = global_position + owner.velocity.normalized()
		z_index = 1 + int(fposmod(rotation_degrees, 360) < 180  + rotation_limit or fposmod(rotation_degrees, 360) > 360 - rotation_limit)
