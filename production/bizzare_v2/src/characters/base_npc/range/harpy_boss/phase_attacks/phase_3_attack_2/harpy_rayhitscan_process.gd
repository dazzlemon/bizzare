extends RayHitscanProcess

func _process(delta):
	#._process(delta)
	cast_to = cast_to.rotated(deg2rad(delta * 2))


func _ready():
	cast_to = Vector2(200,0)
	crosshair = double_up.get_node("../../crosshair")
	double_up = double_up.get_node("../../")
