extends RayHitscanProcess

func _process(delta):
	cast_to = cast_to.rotated(deg2rad(delta * 20))
	._try_damage(delta)


func _ready():
	cast_to = Vector2(200, 0)
	crosshair = double_up.get_node("../../crosshair")
	player_detection_zone = double_up.get_node("../player_detection_zone")
	double_up = double_up.get_node("../../")
