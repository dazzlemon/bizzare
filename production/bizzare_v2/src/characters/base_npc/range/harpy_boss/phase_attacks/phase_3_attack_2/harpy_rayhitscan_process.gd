extends RayHitscanProcess

func _process(delta: float) -> void:
	cast_to = cast_to.rotated(deg2rad(delta * 20))
	._try_damage(delta)


func _ready() -> void:
	cast_to = Vector2(200, 0)
	double_up = get_node("../../")
	crosshair = double_up.get_owner().crosshair
	player_detection_zone = double_up.get_node("../player_detection_zone")
#	double_up = get_node("../../")
#	crosshair = double_up.get_parent().crosshair
#	player_detection_zone = double_up.get_parent().player_detection_zone
