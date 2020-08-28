extends RayHitscanProcess

func _ready():
	._ready()
	double_up = get_node("../../")
	crosshair = double_up.owner.crosshair
	player_detection_zone = double_up.get_parent().player_detection_zone


func _process(delta):
	._process(delta)
	cast_to = crosshair.global_position - double_up.global_position
