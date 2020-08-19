extends RayHitscanProcess

func _ready():
	crosshair = double_up.get_node("../../crosshair")
	double_up = double_up.get_node("../../")
	player_detection_zone = double_up.get_node("../control/player_detection_zone")
