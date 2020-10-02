extends RayHitscanProcess

func _process(delta: float) -> void:
	cast_to = cast_to.rotated(deg2rad(delta * 50))
	._process(delta)


func _ready() -> void:
	cast_to = Vector2(200, 0)
	crosshair = double_up.get_owner().crosshair
	player_detection_zone = double_up.get_node("../player_detection_zone")
